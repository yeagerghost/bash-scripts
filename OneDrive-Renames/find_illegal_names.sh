#!/bin/bash

# Written on Mac OS

# illegal characters considered for this script are ==> * : < > ? / \ | "
illegal_string_regex="\*|:|<|>|\?|\\|/|\||\\\"| +\$|^ +|\.\$"
path="/Path goes here"

find_command="find \"$path\" | grep -E \"$illegal_string_regex\""

eval $find_command > illegal_dirs
echo $find_command 
