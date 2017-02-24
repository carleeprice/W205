#!/bin/bash

git clone https://github.com/carleeprice/W205.git
cd W205/Exercise_1/loading_and_modelling
unzip hospital3.zip

tail -n +2 TEC.csv  > TEC_nohead.csv
tail -n +2 TECS.csv  > TECS_nohead.csv
tail -n +2 TECN.csv  > TECN_nohead.csv
tail -n +2 HGI.csv  > HGI_nohead.csv
tail -n +2 RAD.csv  > RAD_nohead.csv
tail -n +2 HCAHPS.csv  > HCAHPS_nohead.csv

hdfs dfs -mkdir /user/w205/hospital_compare

hdfs dfs -mkdir /user/w205/hospital_compare/TEC
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/TEC_nohead.csv /user/w205/hospital_compare/TEC

hdfs dfs -mkdir /user/w205/hospital_compare/TECS
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/TECS_nohead.csv /user/w205/hospital_compare/TECS

hdfs dfs -mkdir /user/w205/hospital_compare/TECN
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/TECN_nohead.csv /user/w205/hospital_compare/TECN

hdfs dfs -mkdir /user/w205/hospital_compare/HGI
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/HGI_nohead.csv /user/w205/hospital_compare/HGI

hdfs dfs -mkdir /user/w205/hospital_compare/RAD
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/RAD_nohead.csv /user/w205/hospital_compare/RAD

hdfs dfs -mkdir /user/w205/hospital_compare/HCAHPS
hdfs dfs -put /home/w205/W205/Exercise_1/loading_and_modelling/HCAHPS_nohead.csv /user/w205/hospital_compare/HCAHPS