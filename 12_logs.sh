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

dnf install nginx -y &>> $LOGS_FILE
VALIDATE $? "Nginx Installation"

dnf install mysql -y &>> $LOGS_FILE
VALIDATE $? "Mysql Installation"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs Installation"
