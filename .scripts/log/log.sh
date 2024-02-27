#!/bin/sh

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

# whole path to file
path=~/notes/work/turkunlp/logs/$year/$filename

# whole path to file if you open it mid week
path_last_monday=~/notes/work/turkunlp/logs/$year_last_monday/$filename

# current weekday
today=$(date +"%A")

if [ $today == "Monday" ]; then
    if [ -f "$path" ]; then
        nvim -O $path ~/notes/work/turkunlp/logs/2023/todo.md;
    else
        printf "## $mon\n\n\n\n## $tue\n\n\n\n## $wed\n\n\n\n## $thu\n\n\n\n## $fri\n\n\n\n" >> $path;
        nvim -O $path ~/notes/work/turkunlp/logs/2023/todo.md;
    fi
elif [ $today != "Monday" ]; then
    nvim -O $path_last_monday ~/notes/work/turkunlp/logs/2023/todo.md;
fi
