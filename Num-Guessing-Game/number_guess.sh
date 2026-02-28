#!/bin/bash
PSQL="psql --username=freecodecamp -d guessing_game -t --no-align -c"

NUMBER=$(( RANDOM % 1000  + 1 ))
echo Enter your username:
read USER

# user exist in db
CHECK_USER_ROW=$($PSQL "select games_played, best_game from players where username='$USER'")
if [[ -z $CHECK_USER_ROW ]]
  then
# user dont exist
    echo Welcome, $USER! It looks like this is your first time here.
#insert him in base
    INSERT_REPORT=$($PSQL "insert into players(username) values('$USER');")
    
  else
    IFS="|" read GAMES_PLAYED BEST_GAME <<< "$CHECK_USER_ROW"
    echo "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
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
#check new best game
if (( $COUNTER < $BEST_GAME || $BEST_GAME == 0 ))
  then
#insert data in table about best score and number of games
    UPADATE_REPORT=$($PSQL "update players set games_played=games_played + 1, best_game = $COUNTER;")
  else
    UPADATE_REPORT=$($PSQL "update players set games_played=games_played + 1;")
  fi
