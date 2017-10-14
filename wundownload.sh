#!/bin/bash

score="-"
csv=".csv"

echo "Input: Station ID"
read ID

echo "Input: Graphspan (day, month or year)"
read graphspan


if [ "$graphspan" == "day" ]; then
	echo "Input: Day(DD) Month(MM) Year(YYYY)"
	read day month year
	wget -O "$ID""$score""$year""$score""$month""$score""$day""$csv" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&day="$day"&month="$month"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$score""$month""$score""$day""$csv")" > "$ID""$score""$year""$score""$month""$score""$day""$csv"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$score""$month""$score""$day""$csv")" > "$ID""$score""$year""$score""$month""$score""$day""$csv"

fi

if [ "$graphspan" == "month" ]; then
	echo "Input: Month(MM) Year(YYYY)"
	read month year
	wget -O "$ID""$score""$year""$score""$month""$csv" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&month="$month"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$score""$month""$csv")" > "$ID""$score""$year""$score""$month""$csv"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$score""$month""$csv")" > "$ID""$score""$year""$score""$month""$csv"
fi

if [ "$graphspan" == "year" ]; then
	echo "Input: Year(YYYY)"
	read year
	wget -O "$ID""$score""$year""$csv" "https://www.wunderground.com/weatherstation/WXDailyHistory.asp?ID="$ID"&year="$year"&graphspan="$graphspan"&format=1"
	echo "$(sed 's/<br>//' "$ID""$score""$year""$csv")" > "$ID""$score""$year""$csv"
	echo "$(sed '/^\s*$/d' "$ID""$score""$year""$csv")" > "$ID""$score""$year""$csv"
fi

exit 0