select start_day_inclusive, end_day_inclusive
from window_28_days
where
    start_day_inclusive >= '2021-01-01'
    and end_day_inclusive
    <= (select max(inserted_at)::date - interval '1 day' from select_events)
