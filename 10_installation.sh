USERID=$(id -u)

if [ $USERID -ne 0]; then
   echo "please run the script with Root User Access"
   exit 1
fi

echo "Installing Nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "Installing nginx...FAILURE"
   exit 1
else
   echo "Installing Nginx..SUCCESS"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "Installing MySQL...FAILURE"
   exit 1
else
   echo "Installing MYSQL..SUCCESS"
fi

dnf install nodejs -y

if [ $? -ne 0 ]; then
   echo "Installing nodejs...FAILURE" 
   exit 1
else
   echo "Installing nodejs...SUCCESS"
fi

