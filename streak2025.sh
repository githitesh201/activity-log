#!/bin/bash

start="2025-01-01"
end="2025-12-31"

current=$start

while [[ "$current" < "$end" ]] || [[ "$current" == "$end" ]]
do

day=$(date -d "$current" +%u)

if [ $day -ge 6 ]; then
  commits=$((RANDOM % 2))
else
  commits=$((RANDOM % 3 + 1))
fi

for ((i=1;i<=commits;i++))
do
  hour=$((RANDOM % 8 + 10))
  minute=$((RANDOM % 60))

  GIT_AUTHOR_DATE="$current $hour:$minute:00" \
  GIT_COMMITTER_DATE="$current $hour:$minute:00" \
  git commit --allow-empty -m "update: daily progress"

done

current=$(date -I -d "$current + 1 day")

done
