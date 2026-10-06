#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscripts"
LOGS_FILE="/var/log/shellscripts/$0.log"

if [ $USERID -ne 0 ]; then
   echo "Please run the script with Root user access" |tee -a $LOGS_FILE
   exit 1
fi

mkdir -p /var/log/shellscripts

VALIDATE() {

    if [ $? -ne 0 ]; then
       echo "$2..FAILURE" |tee -a $LOGS_FILE
       exit 1
    else
       echo "$2..Success" |tee -a $LOGS_FILE
    fi

}

for app in $@ # sudo sh 14_loops.sh nginx mysql nodejs
do 
   dnf list installed $app &>>$LOGS_FILE
   if [ $? -ne 0]; then
      echo "$app software not installed...installing now"
      dnf install $app -y &>>$LOGS_FILE
      VALIDATE $? "$app Installation"
    else
      echo "$app has already Installed, skipping now"
    fi
done
