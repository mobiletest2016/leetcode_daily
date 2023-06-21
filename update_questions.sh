#!/bin/bash

questions=$(curl -s https://raw.githubusercontent.com/mobiletest2016/leetcode_practice/master/README.md | grep circle)

star_lines=$(echo "$questions" | grep emoji | wc -l)
lines=$(echo "$questions" | grep -v emoji | wc -l)

mv README.md README1.md

date=$(date '+%Y-%m-%d')
echo $date > README.md
echo -e "------" >> README.md

# 3 Qustions with emoji
for i in 1 2 3
do
	rand=$(($RANDOM % $star_lines))
	star=$(echo "$questions" | grep emoji | head -n $rand | tail -1)
	echo -e "\n" >> README.md
	echo ${star%[*} >> README.md
done

# 7 Questions without emoji
for i in `seq 1 7`
do
	rand=$(($RANDOM % $lines))
	q=$(echo "$questions" | grep -v emoji | head -n $rand | tail -1)
	echo -e "\n" >> README.md
	echo ${q%[*} >> README.md
done

echo -e "\n\n" >> README.md

cat README1.md >> README.md

rm README1.md
