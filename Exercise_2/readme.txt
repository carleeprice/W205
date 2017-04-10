ssh into AWS EC2 instance using the AMI 
Name: UCB MIDS W205 EX2-FULL
ID: ami-d4dd4ec3
hadoop should automatically launch, check using ps -ef|grep -i hadoop
attach disk of at least 100 G using mount -t ext2 /dev/<disk name> /data
git clone files from https://github.com/carleeprice/W205.git
cp files from https://github.com/carleeprice/W205/tree/master/Exercise_2 into the instance
Check that the program is correct and executable
sparse run from /Exercise_1/tweetwordcount 
program will continue to run and will need to be interrupted
from /Exercise_2/tweetwordcount run python finalresults.py <word of your choice>
from /Exercise_2/tweetwordcount run python histogram.py <integer1, integer2>