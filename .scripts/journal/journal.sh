#!/bin/sh

# current week as filename
journal_filename=journal_w$(date "+%V").md

# current year
year=$(date "+%Y")

# year last monday (if year changes mid week)
year_last_monday=$(date -d "last monday" +"%Y")

# Get the current date
current_day=$(date --date="today" '+%Y-%m-%d')

# Define an array for next week's dates
next_week_dates=()

# Loop through the next 7 days and store their dates in the array
for ((i=0; i<=6; i++)); do
  date=$(date -d "$current_day + $i days" '+%d')
  next_week_dates+=("$date")
done

# Get the last day of the month
last_day=$(cal | awk 'NF {DAYS = $NF}; END {print DAYS}')

# get this weeks weekdays and their dates for printing them to the journal
mon="## $(date --date="today" +"%a %d-%m-%Y")\n\n"
tue="## $(date --date="next Tuesday" +"%a %d-%m-%Y")\n\n"
wed="## $(date --date="next Wednesday" +"%a %d-%m-%Y")\n\n"
thu="## $(date --date="next Thursday" +"%a %d-%m-%Y")\n\n- [ ] Water the plants"
fri="## $(date --date="next Friday" +"%a %d-%m-%Y")\n\n"
sat="## $(date --date="next Saturday" +"%a %d-%m-%Y")\n\n"
sun="## $(date --date="next Sunday" +"%a %d-%m-%Y")\n\n- [ ] Weekly journal"
weekdays=("$mon" "$tue" "$wed" "$thu" "$fri" "$sat" "$sun")

# whole path to file
journal_path=~/notes/personal/journal/$year/$journal_filename

# whole path to file if you open it mid week
journal_path_last_monday=~/notes/personal/journal/$year_last_monday/$journal_filename

# current weekday
today=$(date +"%A")

if [ $today == "Monday" ]; then
  if [ -f "$journal_path" ]; then
    nvim $journal_path; 
  else
    # Check if the last day of the month is on next week and add monthly todos 
    # if it is. Otherwise just create a normal journal file.
    for index in "${!next_week_dates[@]}"; do
      day=${next_week_dates[index]}
      if [ "$day" -eq "$last_day" ]; then
        printf "${weekdays[index]}- [ ] Pay the bills\n\n" >> $journal_path
#      elif [ "$day" -eq "01" ]; then
#        printf "${weekdays[index]}- [ ] Hours to CATS\n\n" >> $journal_path
      else
        printf "${weekdays[index]}\n\n" >> $journal_path
      fi
    done
    printf "## Next week\n\n\n\n" >> $journal_path
    nvim $journal_path;
  fi
elif [ $today != "Monday" ]; then
    nvim $journal_path_last_monday;
fi
