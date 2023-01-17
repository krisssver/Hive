use yellow_taxi;

create table taxi_data_group_t as
select
    payment_type,
    tpep_pickup_dt,
    tip_amount_avg,
    passenger_count_total
from taxi_data_group_v
order by 1, 2;