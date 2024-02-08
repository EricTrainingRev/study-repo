#!/bin/bash

# the line above is the shebang: it tells your shell what program to use to execute your script.
# if no program is specified then whatever shell you are using will handle executing your script
# It is good practice to provide the shebang, especially if you need a specific program to execute your script

# This variable will exist for the lifecycle of the shell, even after the script is done
echo $variable_name

# This variables will only exist for the lifespan of your current shell
# if you want to make these variables permanent you need to save them in your
# .bashrc file in your home directory (/home/this_directory)

# double quotes will provide the value of your variable (allows shell expansion)
# single quotes will not

echo "Your variable: $variable_name"
echo 'Your variable: $variable_name'

# no prompt, whatever user types into terminal is the value of the variable
read user_inputed_variable

echo $user_inputed_variable

# you can give a prompt to the user to tell them what the value they are giving you is for
read -p "Please tell us your desired username: " input_username

# if users need to provide sensitive data you can make the input "silent"
read -sp "Please set a password for your account: " input_password

echo $input_username
echo $input_password

# scripts have a few default variables, some of these are $1-$9. This is how you access arguments
# provided to your script

# this example here requires two arguments for the script, if they are not provided then the variables
# will simply be empty
echo "Hello $1 and $2!"

# some more built in variables to be aware of
# $0 this is name of the shell

echo $0

# $@ is a list of the arguments provided to the script

echo $@

# $$ is the process id of the script

echo $$

# $SECONDS tells how long the shell has been running

echo $SECONDS

# If we we want to pipe something inside our script we just reference the stdin stream
# note we need the input for this to be piped in from outside of the script
cat /dev/stdin | grep log


# if statements in bash work basically the same as all other languages: if a condition is true the
# nested section of the script is executed

# 1 does equal 1, so the nested section of the script will execute
if [ 1 -eq 1 ] 
    # make sure you put the "then" keyword on a separate line from the if statement
    then
    echo "One does, in fact, equal one"
fi

# 1 does not equal 2, so the nested section of the script will not execute
if [ 1 -eq 2 ]
    then
    echo "We have broken the maths"
fi

# make sure your logical check has a space between the brackets and what you are checking
# [3==4] will cause a "command not found error"
# [ 3==4 ] will work as expected
if [ 3 -eq 4 ]
    then
    echo "The world of math continues to be astonished at this new discovery"
else
    echo "Math continues to be safe, everything is ok"
fi

# If you have multiple conditions to check you can split the logic using elif statements

if [ 1 -eq 3 ]
    then
    echo "this should not print to the terminal"
elif [ 2 -eq 2 ]
    then
    echo "Two does in fact equal two"
else
    echo "this also should not print to the terminal"
fi

# Some of the common operators for your logical statements:
# -lt = < (less than)
# -gt = > (greater than)
# -le = <= (less than or equal to)
# -ge = >= (greater than or equal to)
# -eq = == (equal)
# -ne = != (not equal)

if [ 1 -ne 2 ]
    then
    echo " x"
fi

# Using logical operators you can make your logic more complex: || for OR and && for AND
# make sure to wrap each logical condition in square brackets
if [ 1 -eq 1 ] || [ 2 -eq 3 ]
    then
    echo "This does not math"
else
    echo "both conditions are not true"
fi


# you can loop through a range by using the format {start..end} (this range is inclusive at start and end)
for num in {1..10}
    do
    echo $num
done

for even in {2..10..2}
    do
    echo $even
done

for odd in {1..10..2}
    do
    echo $odd
done

# ranges are useful, but we may want to do something where we don't know the range, we instead loop
# through a resource like a file or directory

# IFS = Internal Field Separater
# for this script purpose, I want only to iterate the lines of text, not through each word
# the default is whitespace and new line characters
IFS=$'\n'
# to reference the output of the cat command (the actual file content) we wrap the command in $()
for line in $(cat $1)
    do
    echo $line
done

count=1
while [ $count -le 10 ]
    do
    echo $count
    # when setting the variable to a new value, make sure not to use the $
    # when doing simple math (only whole numbers by default) you wrap the numbers in (())
    # if you are saving the value add a $ to the front
    ((count+=1))
done

# if you don't want to shorthand the math you could do the following:
# count=$(($count+1))