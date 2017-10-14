#!/bin/bash

score="-"
txt=".txt"

echo "Input: Station ID"
read ID

echo "Input: Graphspan (day, month or year)"
read graphspan


if [ "$graphspan" == "day" ]; then
	echo "Input: Day(DD) Month(MM) Year(YYYY)"
	read day month year
	wget -O "$ID""$score""$year""$score""$month""$score""$day""$txt" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&day="$day"&month="$month"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$score""$month""$score""$day""$txt")" > "$ID""$score""$year""$score""$month""$score""$day""$txt"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$score""$month""$score""$day""$txt")" > "$ID""$score""$year""$score""$month""$score""$day""$txt"

fi

if [ "$graphspan" == "month" ]; then
	echo "Input: Month(MM) Year(YYYY)"
	read month year
	wget -O "$ID""$score""$year""$score""$month""$txt" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&month="$month"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$score""$month""$txt")" > "$ID""$score""$year""$score""$month""$txt"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$score""$month""$txt")" > "$ID""$score""$year""$score""$month""$txt"
fi

if [ "$graphspan" == "year" ]; then
	echo "Input: Year(YYYY)"
	read year
	wget -O "$ID""$score""$year""$txt" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$txt")" > "$ID""$score""$year""$txt"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$txt")" > "$ID""$score""$year""$txt"
fi

exit 0