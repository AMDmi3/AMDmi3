#!/bin/sh

curl -s "https://github-readme-stats.vercel.app/api?username=AMDmi3&count_private=true&show_icons=true&hide=stars&hide_border=true&include_all_commits=true&dummy=$(date +%s)" | sed -e 's|\([0-9k]\)</text|\1+</text|' > images/stats.svg.tmp

if grep -q 'Rank: S' images/stats.svg.tmp; then
	mv images/stats.svg.tmp images/stats.svg
else
	echo "Badge is broken, please regenerate"
	exit 1
fi
