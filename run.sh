hive -f create_ref_vendor.sql
hive -f create_ref_payment.sql
hive -f create_ref_rate.sql
hive -f create_and_insert_taxi_data_parquet.sql
hive -f create_taxi_data_group_v.sql
hive -f create_taxi_data_group_t.sql