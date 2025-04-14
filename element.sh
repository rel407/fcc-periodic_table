#! /bin/bash

# Set database connection
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Set argument as USER_INPUT variable, if provided
USER_INPUT=$1

# Main code
if [[ $USER_INPUT ]]
then

  # Check if user's input is a number
  if [[ $USER_INPUT =~ ^[0-9]+$ ]]
  then
    # Query by atomic number
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number = $USER_INPUT")

    # If atomic_number is not found
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
    else
      # Set the other variables if the atomic_number is found
      SYMBOL=$($PSQL "select symbol from elements where atomic_number = $ATOMIC_NUMBER")
      NAME=$($PSQL "select name from elements where atomic_number = $ATOMIC_NUMBER")
      ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER")
      MPC=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
      BPC=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
      TYPEID=$($PSQL "select type_id from properties where atomic_number = $ATOMIC_NUMBER")
      TYPE=$($PSQL "select t.type from types t join properties p on t.type_id = p.type_id where p.atomic_number = $ATOMIC_NUMBER")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    fi

  # If the user's input is NOT a number
  else

    # Try querying by symbol
    SYMBOL=$($PSQL "select symbol from elements where symbol = '$USER_INPUT'")
    
    # If symbol not found
    if [[ -z $SYMBOL ]]
    then
      # Try querying by name
      NAME=$($PSQL "select name from elements where name = '$USER_INPUT'")
      
      # If name is not found
      if [[ -z $NAME ]]
      then
        echo "I could not find that element in the database."
      else
        ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name = '$USER_INPUT'")
        SYMBOL=$($PSQL "select symbol from elements where name = '$USER_INPUT'")
        ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER")
        MPC=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
        BPC=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
        TYPEID=$($PSQL "select type_id from properties where atomic_number = $ATOMIC_NUMBER")
        TYPE=$($PSQL "select t.type from types t join properties p on t.type_id = p.type_id where p.atomic_number = $ATOMIC_NUMBER")
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      fi
    
    # Set variables if symbol is found
    else
      ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol = '$USER_INPUT'")
      NAME=$($PSQL "select name from elements where symbol = '$USER_INPUT'")
      ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER")
      MPC=$($PSQL "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
      BPC=$($PSQL "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
      TYPEID=$($PSQL "select type_id from properties where atomic_number = $ATOMIC_NUMBER")
      TYPE=$($PSQL "select t.type from types t join properties p on t.type_id = p.type_id where p.atomic_number = $ATOMIC_NUMBER")
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
    fi
  fi
else
  echo "Please provide an element as an argument."
  exit
fi
