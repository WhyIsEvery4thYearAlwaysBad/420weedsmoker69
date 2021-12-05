#!/bin/sh
# POSIX Baby!
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# Function to generate ONLY position calls. I know this function could probably be optimized to not use 19 for loops, but that's too much work.
# $1 - The name of the thing to make class calls for. (Singular)
# $2 - The name of the thing to make class calls for. (Plural)
# $3 - Tab String
# $4 - The entire CMenu line. Default val: NOFORMAT "Pos" {

Classes="'scout solly pyro' 'demo heavy engi' 'med sniper spy'"

TAB_STR="$3"
printf "%s" "$4"
for ClassGroup in 'scout solly pyro' 'demo heavy engi' 'med sniper spy'
do
	printf "$TAB_STR\"[%s]\" {\n" "$(printf "%s" "$ClassGroup" | tr "[:space:]" '/')"
	for Class in $ClassGroup
	do
		printf "$TAB_STR\t\"[%s]\" {\n" "$Class"
	done
done