#!/bin/bash
PSQL="psql -U freecodecamp -d periodic_table -t --no-align -c"


#if no argument, end program here
if [[ -z $1  ]]
  then
    echo Please provide an element as an argument.
    exit
  fi
#return information about given element
if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOM=$($PSQL "select atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius  from elements join properties using(atomic_number) join types using(type_id) where atomic_number = $1;")
#    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number = $1;")
#    SYMBOL=$($PSQL "select symbol from elements where atomic_number = $1;")
#   NAME=$($PSQL "select name from elements where atomic_number = $1;")
  else
    ATOM=$($PSQL "select atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius  from elements join properties using(atomic_number) join types using(type_id) where symbol='$1'::VARCHAR or name='$1'::VARCHAR;")
#    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1'::VARCHAR or name='$1'::VARCHAR;")
#    SYMBOL=$($PSQL "select symbol from elements where symbol='$1'::VARCHAR or name='$1'::VARCHAR;")
#    NAME=$($PSQL "select name from elements where symbol='$1'::VARCHAR or name='$1'::VARCHAR;")
  fi
if [[ -z $ATOM ]]
  then
    echo I could not find that element in the database.
    exit
  fi

IFS='|' read ATOMIC_NUMBER SYMBOL NAME TYPE MASS MELTING BOILING <<< "$ATOM"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."

 #i deleted row from psql, not in scipt