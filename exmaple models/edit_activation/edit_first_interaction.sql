select
    user_id,
    
    min(
       inserted_at
    ) as first_edit_interaction
from {{ ref('select_edit_style_related_events') }}
where
        topic not like '%catalog%'
    and topic not like '%correction%'
    and topic != 'select_ship_disable_edit'
    and topic != 'select_ship_disable_open_in_editing_program'
    and topic != 'select_ship_open_in_editing_program'
    and topic != 'select_pick_editing_program_path'
    and topic != 'select_credit_balance_menu_click_train_style'
    and topic != 'select_open_credit_balance_menu'
    and topic != 'select_credit_balance_menu_click_explore'



group by 1