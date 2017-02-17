drop table tec_nohead;

 create external table tec_nohead
 (
 provider_id string,
 hospital_name string,
 address string,
 city string,
 state string,
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

 ROW FORMAT DELIMITED
 FIELDS TERMINATED BY ','
 STORED AS TEXTFILE
 LOCATION '/user/w205/hospital_compare/TEC';
 