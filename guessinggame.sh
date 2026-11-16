#!/usr/bin/env bash
# File: guessinggame.sh
# A game where the user guesses the number of files in the current directory

function count_files {
    local nb=$(ls -1 | wc -l)
    echo $nb
}

function check_guess {
    if [[ $1 -lt $2 ]]
    then
        echo "Your guess is too low. Try again!"
    elif [[ $1 -gt $2 ]]
    then
        echo "Your guess is too high. Try again!"
    fi
}

answer=$(count_files)
guess=-1

echo "Welcome to the guessing game!"

while [[ $guess -ne $answer ]]
do
    echo "How many files are in the current directory?"
    read guess

    if ! [[ $guess =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid number."
        guess=-1
        continue
    fi

    check_guess $guess $answer
done

echo "Congratulations! You guessed it: there are $answer files in this directory."
