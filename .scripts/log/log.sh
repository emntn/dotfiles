#!/bin/sh

# Usage:
# ./weekly-note.sh companyname

if [ -z "$1" ]; then
    echo "Usage: $0 <company>"
    exit 1
fi

company="$1"

# current week as filename
filename=log_w$(date "+%V").md

# current year
year=$(date "+%Y")

# year last monday (if year changes mid week)
year_last_monday=$(date -d "last monday" +"%Y")

# get this weeks weekdays and their dates
mon=$(date --date="today" +"%a %d-%m-%Y")
tue=$(date --date="next Tuesday" +"%a %d-%m-%Y")
wed=$(date --date="next Wednesday" +"%a %d-%m-%Y")
thu=$(date --date="next Thursday" +"%a %d-%m-%Y")
fri=$(date --date="next Friday" +"%a %d-%m-%Y")

# base paths
base_path=~/notes/work/$company/logs

# whole path to file
path=$base_path/$year/$filename

# whole path to file if you open it mid week
path_last_monday=$base_path/$year_last_monday/$filename

# todo files
todo_path=$base_path/$year/todo.md
todo_path_last_monday=$base_path/$year_last_monday/todo.md

# current weekday
today=$(date +"%A")

if [ "$today" = "Monday" ]; then
    mkdir -p "$base_path/$year"

    if [ -f "$path" ]; then
        nvim -O "$path" "$todo_path"
    else
        printf "## $mon\n\n\n\n## $tue\n\n\n\n## $wed\n\n\n\n## $thu\n\n\n\n## $fri\n\n\n\n" >> "$path"
        nvim -O "$path" "$todo_path"
    fi
else
    nvim -O "$path_last_monday" "$todo_path_last_monday"
fi
