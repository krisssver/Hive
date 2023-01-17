use yellow_taxi;

create view taxi_data_group_v as
with prepare_data as (
select case when p.name is null then 'Unknown' else p.name end as payment_type,
       t.tpep_pickup_dt,
       t.tip_amount,
       t.passenger_count
from taxi_data_parquet t
left join ref_payment p on p.id = t.payment_type
where extract(year from tpep_pickup_dt) = 2020
)
select payment_type,
       tpep_pickup_dt,
       avg(tip_amount) as tip_amount_avg,
       sum(passenger_count) as passenger_count_total
from prepare_data
group by payment_type, tpep_pickup_dt;