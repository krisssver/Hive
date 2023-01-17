use yellow_taxi;

create external table ref_payment
(
    id int,
    name string
)
stored as parquet;

insert into ref_payment
select 1, 'Credit card'
union all
select 2, 'Cash'
union all
select 3, 'No charge'
union all
select 4, 'Dispute'
union all
select 5, 'Unknown'
union all
select 6, 'Voided trip';