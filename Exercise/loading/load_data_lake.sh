git clone https://github.com/carleeprice/W205.git
cd W205/Exercise/loading
ls
unzip hospital.zip
ls
du -s TEC.csv

tail -n +2 TEC.csv  > TEC_nohead.csv
tail -n +2 TECS.csv  > TECS_nohead.csv
tail -n +2 HGI.csv  > HGI_nohead.csv
tail -n +2 RAD.csv  > RAD_nohead.csv
tail -n +2 HCAHPS.csv  > HCAHPS_nohead.csv
ls

hdfs dfs -ls

hdfs dfs -mkdir /user/w205/hospital_compare/TEC
hdfs dfs -put /home/w205/W205/Exercise/loading_and_modelling/TEC_nohead.csv /user/w205/hospital_compare/TEC

hdfs dfs -mkdir /user/w205/hospital_compare/TECS
hdfs dfs -put /home/w205/W205/Exercise/loading_and_modelling/TECS_nohead.csv /user/w205/hospital_compare/TECS

hdfs dfs -mkdir /user/w205/hospital_compare/HGI
hdfs dfs -put /home/w205/W205/Exercise/loading_and_modelling/HGI_nohead.csv /user/w205/hospital_compare/HGI

hdfs dfs -mkdir /user/w205/hospital_compare/RAD
hdfs dfs -put /home/w205/W205/Exercise/loading_and_modelling/RAD_nohead.csv /user/w205/hospital_compare/RAD

hdfs dfs -mkdir /user/w205/hospital_compare/HCAHPS
hdfs dfs -put /home/w205/W205/Exercise/loading_and_modelling/HCAHPS_nohead.csv /user/w205/hospital_compare/HCAHPS
