use yellow_taxi;

create external table ref_vendor
(
    id int,
    name string
)
stored as parquet;

insert into ref_vendor
select 1, 'Creative Mobile Technologies, LLC'
union all
select 2, 'VeriFone Inc';