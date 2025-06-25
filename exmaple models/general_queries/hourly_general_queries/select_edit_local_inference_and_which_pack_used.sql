with
    account_packs as (
        select ap.id, pack_id, stripe_payment_intent_id, p.name as pack_name
        from core.account_packs ap
        join core.packs p on p.id = ap.pack_id
    ),
    payments as (
        select ap.id, amount / 100.0 as amount, created, ap.pack_name
        from stripe.payment_intents pi
        join account_packs ap on ap.stripe_payment_intent_id = pi.id
        where pi.status = 'succeeded' and receipt_email not like '%narrative.so%'
    ),
    credit_purchases_increases as (
        select
            ct.*,
            sum(credits) over (
                partition by account_id
                order by inserted_at
                rows between unbounded preceding and current row
            ) as running_total_purchased_credits,
            amount / credits as rev_per_credit
        from core.credit_transactions ct
        left join payments p on p.id = ct.entry_id
        where credits > 0
        order by account_id, inserted_at
    ),
    styles as (
        select distinct
            data:narrative_forever_image_id::string,
            data:style_id::string,
            data:modal_id::string,
            e.inserted_at
        from {{ ref("select_edit_style_related_events") }} e
        join core.user_permissions up on up.user_id = e.user_id
        where
            topic = 'select_edit_image_edited_outcome'
            and data:narrative_forever_image_id::string is not null
            and data:success::boolean = true
        order by e.inserted_at desc
    ),
    credit_purchases_increases_with_previous as (
        select
            *,
            coalesce(
                lag(running_total_purchased_credits, 1) over (
                    partition by account_id order by inserted_at
                ),
                0
            ) as previous_running_total_purchased_credits
        from credit_purchases_increases
    ),
    edit_inferences_rolling_count as (
        select
            i.*,
            count(narrative_image_id) over (
                partition by i.account_id
                order by inserted_at, i.narrative_image_id
                rows between unbounded preceding and current row
            ) as running_total
        from core.inferences i
        join core.inference_groups ig on ig.id = i.inference_group_id
    ),
    credit_purchases_joint_with_usage as (
        select distinct
            user_id,
            oe.running_total_purchased_credits,
            oe.previous_running_total_purchased_credits,
            ei.running_total,
            oe.entry_type,
            ei.narrative_image_id,
            first_value(s.style_id) over (
                partition by user_id, narrative_image_id
                order by s.inserted_at
                rows between unbounded preceding and unbounded following
            ) as style_id,
            first_value(s.modal_id) over (
                partition by user_id, narrative_image_id
                order by s.inserted_at
                rows between unbounded preceding and unbounded following
            ) as modal_id,
            first_value(s.inserted_at) over (
                partition by user_id, narrative_image_id
                order by s.inserted_at
                rows between unbounded preceding and unbounded following
            ) as inserted_at,
            inference_group_id,
            oe.rev_per_credit
        from edit_inferences_rolling_count as ei
        join
            credit_purchases_increases_with_previous as oe
            on oe.account_id = ei.account_id
            and running_total <= running_total_purchased_credits
            and running_total > previous_running_total_purchased_credits
        join styles s on ei.narrative_image_id = s.narrative_forever_image_id
        join core.user_permissions up on up.account_id = oe.account_id
    )
select
    user_id,
    modal_id as local_inference_id,
    min(inserted_at) as start_inference_at,
    count(narrative_image_id) * -1.0 as credits_used,
    running_total_purchased_credits - max(running_total) as credit_balance,
    entry_type as pack_used_type
from credit_purchases_joint_with_usage
group by user_id, modal_id, running_total_purchased_credits, entry_type
order by user_id, 3
