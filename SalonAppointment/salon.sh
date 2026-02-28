#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

#($PSQL "select * from services") | sed 's/|/)/g'> new.txt
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can i help you?\n"
#cat $(($PSQL "select * from services;" | sed 's/|/)/') | grep -o '*')
#printf "%s\n" "$($PSQL "select * from services;" | sed 's/|/)/')"
echo  "$($PSQL "select * from services;" | sed 's/|/) /')"
#echo -e "$($PSQL "select * from services where service_id=10;" | sed 's/|/) /')\n"
read SERVICE_ID_SELECTED
SERVICE="$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED';")"
while [[ $SERVICE == "" ]]
  do
    
    echo -e "\n$($PSQL "select * from services;" | sed 's/|/) /')"
    read SERVICE_ID_SELECTED
    SERVICE="$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED';")"
  done
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
#ako ne postoji u bazi
if [[ "$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")" == "" ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert into table
    echo "$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")"
    
  fi
if [[ $CUSTOMER_NAME == "" ]]
  then
    CUSTOMER_NAME="$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")"
  fi
  CUSTOMER_ID="$($PSQL "select customer_id from customers where name='$CUSTOMER_NAME';")"

echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
read SERVICE_TIME

$PSQL "insert into appointments(time, customer_id, service_id) values('$SERVICE_TIME','$CUSTOMER_ID', '$SERVICE_ID_SELECTED');"
echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."