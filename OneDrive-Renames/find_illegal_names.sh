#!/bin/bash

# Written on Mac OS

# illegal characters considered for this script are ==> * : < > ? / \ | " and files that begin with a space, files that end with a .
illegal_string_regex="\*|:|<|>|\?|\\|/|\||\\\"| +\$|^ +|\.\$"
path="/Path goes here"

find_command="find \"$path\" | grep -E \"$illegal_string_regex\""

eval $find_command > illegal_name_list
