#!/bin/bash

set -e #this will be checking Erros, if Errors it will be Fail

trap 'echo "There is an Error in Line $LINENO...command $BASH_COMMAND"' ERR

USERID=$(id -u)
LOGS_FOLDER="/var/log/shellscripts"
LOGS_FILE="/var/log/shellscripts/$0.log"

R='\033[0;31m' #Red
Y='\033[0;33m' #Yellow
B='\033[0;34m' #Blue
W='\033[0;37m' #white
G='\033[0;32m' #Green
N='\033[0m' #No colour

if [ $USERID -ne 0 ]; then
   echo -e "$R Please run the script $N.. $Y with Root user access" |tee -a $LOGS_FILE
   exit 1
fi

mkdir -p /var/log/shellscripts

VALIDATE() {

    if [ $? -ne 0 ]; then
       echo -e "$2..$ FAILURE" |tee -a $LOGS_FILE
       exit 1
    else
       echo -e "$2..$G Success" |tee -a $LOGS_FILE
    fi

}

for app in $@ # sudo sh 14_loops.sh nginx mysql nodejs
do 
   dnf list installed $app &>>$LOGS_FILE
   if [ $? -ne 0 ]; then
      echo -e "$app $R software not installed $N...$G installing now $N"
      dnf install $app -y &>>$LOGS_FILE
      VALIDATE $? "$app Installation"
    else
      echo -e "$app $G has already Installed $N, $Y skipping now $N"
    fi
done
