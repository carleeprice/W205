
drop table tec_raw;

create external table tec_raw
(
provider_id int,
hospital_name string,
address string,
city string,
h_state string,
zip_code int,
county string,
phone_no int,
condition string,
measure string,
measure_name string,
score int,
sample int,
footnote string,
measure_start string,
measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '//'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/TEC';
 

drop table tecs_raw;

create external table tecs_raw
(
h_state string,
condition string,
measure_name string,
measure string,
score int,
footnote string,
measure_start string,
measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '//'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/TECS';

drop table rad_raw;

create external table rad_raw
(
provider_id int,
hospital_name string,
address string,
city string,
h_state string,
zip_code int,
county string,
phone_no int,
measure_name string,
measure_id string,
relative_natl string,
denominator int,
score int,
low_est int,
high_est int,
footnote string,
measure_start string,
measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '//'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/RAD';



drop table hgi_raw;

create external table hgi_raw
(
provider_id int,
hospital_name string,
address string,
city string,
h_state string,
zip_code int,
county string,
phone_no int,
hosp_type string,
hosp_oship string,
emer_yn string,
elec_record_yn string,
oall_rating int,
oall_rating_footnote string,
mort_compare string,
mort_footnote string,
safety_compare string,
safety_footnote string,
readmit_compare string,
readmit_footnote string,
patexp_compare string,
patexp_footnote string,
effcare_compare string,
effcare_footnote string,
timecare_compare string,
timecare_footnote string,
effuse_compare string,
effuse_footnote string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '//'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/HGI';




drop table hcahps_raw;

create external table hcahps_raw
(
provider_id int,
hospital_name string,
address string,
city string,
h_state string,
zip_code int,
county string,
phone_no int,
hcahps_measure_id string,
hcahps_q string,
hcahps_a string,
star_rating int,
star_rating_foot string,
pct_resp string,
pct_resp_foot string,
linear_mean_val int,
survey_count int,
survey_no_foot string,
survey_pct int,
survey_pct_foot,
measure_start string,
measure_end string
)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '//'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/HCAHPS';
