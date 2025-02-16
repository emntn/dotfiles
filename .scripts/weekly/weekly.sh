#!/bin/sh

# filename
filename=weekly_w$(date "+%V").md

# filename
filename_last_week=weekly_w$(date --date="last week" "+%V").md

# current year
year=$(date -d "today" "+%Y")

# year last monday (if year changes mid week)
year_last_monday=$(date -d "last monday" +"%Y")

# whole path
path=~/notes/personal/reflections/$year/weekly/$filename

# whole path to file if you open it mid week
path_last_monday=~/notes/personal/reflections/$year_last_monday/weekly/$filename_last_week

# file extension
extension="${filename##*.}"

if [ -f "$path" ]; then
    nvim -O $path_last_monday $path;
else
   cp -n ~/.scripts/weekly/weekly_template.md $path;
   nvim -O $path_last_monday $path;
fi
