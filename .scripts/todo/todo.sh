#!/bin/sh

# current week as filename
filename=todos_w$(date "+%V").md

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
sat=$(date --date="next Saturday" +"%a %d-%m-%Y")
sun=$(date --date="next Sunday" +"%a %d-%m-%Y")

# whole path to file
path=~/notes/todos/$year/$filename

# whole path to file if you open it mid week
path_last_monday=~/notes/todos/$year_last_monday/$filename

# current weekday
today=$(date +"%A")

if [ $today == "Monday" ]; then
    if [ -f "$path" ]; then
        nvim $path;
    else
        echo "### $mon\n\n- [ ] Weekly journal\n\n### $tue\n\n\n\n### $wed\n\n\n\n### $thu\n\n\n\n### $fri\n\n\n\n### $sat\n\n\n\n### $sun\n\n\n" >> $path; nvim $path;
    fi
elif [ $today != "Monday" ]; then
    nvim $path_last_monday;
fi
