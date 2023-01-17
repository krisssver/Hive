use yellow_taxi;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions=1000;
set hive.exec.max.dynamic.partitions.pernode=1000;


--создание промежуточной таблицы
create external table taxi_data
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
row format delimited
fields terminated by ','
lines terminated by '\n'
location 'hdfs://rc1b-dataproc-m-ebpell8yg7ncnqgc.mdb.yandexcloud.net./user/root/2020'
TBLPROPERTIES ("skip.header.line.count"="1");

--создание партиционированной таблицы
create external table taxi_data_parquet
(
vendor_id string,
tpep_pickup_datetime timestamp,
tpep_dropoff_datetime timestamp,
passenger_count int,
trip_distance double,
ratecode_id int,
store_and_fwd_flag string,
pulocation_id int,
dolocation_id int,
payment_type int,
fare_amount double,
extra double,
mta_tax double,
tip_amount double,
tolls_amount double,
improvement_surcharge double,
total_amount double,
congestion_surcharge double
)
partitioned by (tpep_pickup_dt date);

insert into table taxi_data_parquet partition (tpep_pickup_dt) select t.*, date(t.tpep_pickup_datetime) as tpep_pickup_dt from taxi_data t;