#!/bin/bash

# define a web browser
DMBROWSER="firefox --new-tab --url"


# create an array
declare -a options=(
"aw - https://wiki.archlinux.org/?search="
"yts - https://www.youtube.com/results?search_query="
)

# picking a search engine
while [ -z "$engine" ]; do
	 enginelist=$(printf '%s\n' "${options[@]}" | dmenu -i -l 20 -p 'Choose search engine :') || exit
	 engineurl=$(echo "enginelist" | awk '{print $NF}')
	 engine=$(echo "enginelist" | awk '{print $1}')
done

# searching the chosen engine
while [ -z "$query" ]; do
	 query=$(dmenu -i -l 20 -p 'Searching $engine :') || exit
done

# display search web result in web browser
$DMBROWSER "$engineurl""$query"
