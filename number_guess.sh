#!/bin/bash
PSQL="psql --username=freecodecamp -d guessing_game -t --no-align -c"

NUMBER=$(( RANDOM % 400  + 1 ))
echo Enter your username:
read USER

# user exist in db
#echo Welcome back, $USER! You have played <games_played> games, and your best game took <best_game> guesses.
CHECK_USER=$($PSQL "select username from players where username='$USER'")
if [[ -z $CHECK_USER ]]
  then
# user dont exist
    echo Welcome, $USER! It looks like this is your first time here.
#enter him in base
    $PSQL "insert into players(username) values($USER);"
  
echo Guess the secret number between 1 and 1000:
GUESS=0
COUNTER=0

while (( $GUESS != $NUMBER ))
  do
    read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
      then
        (( COUNTER ++ ))

        if (( $GUESS < $NUMBER ))
        then
          echo "It's higher than that, guess again:"
          
          continue
        fi

        if  (( $GUESS > $NUMBER ))
        then
          echo "It's lower than that, guess again:"
          
          continue
        fi

    else
    echo That is not an integer, guess again:
    
    fi
  done


  echo You guessed it in $COUNTER tries. The secret number was $NUMBER. Nice job!


