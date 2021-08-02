#!/bin/sh
# POSIX Baby!
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# Function to generate ONLY position calls. I know this function could probably be optimized to not use 19 for loops, but that's too much work.
# $1 - The name of the thing to make pos calls for. (Singular)
# $2 - The name of the thing to make pos calls for. (Plural)
# $3 - Tab String
# $4 - The entire CMenu line. Default val: NOFORMAT "Pos" {

# Positions:
# * 1 - Left
# * 2 - Mid
# * 3 - Right
# * 4 - Front/Lower
# * 5 - Back/Lower
TAB_STR="$3"
printf "${TAB_STR}%s\n" "${4:-"\"[Pos]\" {"}"
# Positional directions.
# In front
printf "${TAB_STR}\tKEY=\"4\" NOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {\n"
## In front left
printf "${TAB_STR}\t\tKEY=\"1\" NOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT LEFT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s FRONT LEFT (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n" "${TAB_STR}"
## In front right
printf "${TAB_STR}\t\tKEY=\"3\" NOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> \" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT RIGHT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s FRONT RIGHT (TEAM SIDE) (BIND)\" |\n" "$Amount" "$2"
done
printf "${TAB_STR}\t\t}\n" "${TAB_STR}"
## In front mid
printf "${TAB_STR}\t\tKEY=\"2\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT MID (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT MID (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t}\n"
## In front upper
printf "${TAB_STR}\t\tKEY=\"4\" NOFORMAT \"\" {\n"
### In front upper left
printf "${TAB_STR}\t\t\tNOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT UPPER LEFT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT UPPER LEFT (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
### In front upper right
printf "${TAB_STR}\t\t\tKEY=\"3\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT UPPER RIGHT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT UPPER RIGHT (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
### In front upper
printf "${TAB_STR}\t\t\tKEY=\"2\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT UPPER MID (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT UPPER MID (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
# Done
printf "${TAB_STR}\t\t}\n"
## In front lower
printf "${TAB_STR}\t\tKEY=\"5\" NOFORMAT \"\" {\n"
### In front lower left
printf "${TAB_STR}\t\t\tKEY=\"1\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT LOWER LEFT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT LOWER LEFT (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
### In front lower right
printf "${TAB_STR}\t\t\tKEY=\"3\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 FRONT LOWER RIGHT (TEAM SIDE) (BIND)\" |\n"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} $2 FRONT LOWER RIGHT (TEAM SIDE) (BIND)\" |\n"
done
printf "${TAB_STR}\t\t\t}\n"
### In front lower
printf "${TAB_STR}\t\t\tKEY=\"2\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 FRONT LOWER MID (BIND)\" |\n"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} $2 FRONT LOWER MID (BIND)\" |\n"
done
# Done
printf "${TAB_STR}\t\t\t}\n"
printf "${TAB_STR}\t\t}\n"
printf "${TAB_STR}\t}\n"
# </Front>
# <Mid>
printf "${TAB_STR}\tKEY=\"2\" NOFORMAT \"[1]    [2]    [3]<cr>\" {\n"
# Mid mid
printf "${TAB_STR}\t\tKEY=\"2\" NOFORMAT \"<clr:234,209,174>       [5]       <cr>\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %i %s MID (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t}\n"
# Mid upper
printf "${TAB_STR}\t\tKEY=\"4\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID UPPER (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s MID UPPER (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
# Mid lower
printf "${TAB_STR}\t\tKEY=\"5\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID LOWER (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s MID LOWER (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
printf "${TAB_STR}\t}\n"
# </Mid>
# <Left>
printf "${TAB_STR}\tKEY=\"1\" NOFORMAT \" \" {\n"
# Left left
printf "${TAB_STR}\t\tKEY=\"1\" NOFORMAT \" \" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
## Left upper
printf "${TAB_STR}\t\tKEY=\"4\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT UPPER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT UPPER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
## Left lower
printf "${TAB_STR}\t\tKEY=\"5\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT LOWER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT LOWER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
# Done
printf "${TAB_STR}\t}\n"
# </Left>
# <Right>
printf "${TAB_STR}\tKEY=\"3\" NOFORMAT \" \" {\n"
# Right right
printf "${TAB_STR}\t\tKEY=\"3\" NOFORMAT \" \" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
## Right upper
printf "${TAB_STR}\t\tKEY=\"4\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT UPPER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT UPPER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
## Right lower
printf "${TAB_STR}\t\tKEY=\"5\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT LOWER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT LOWER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t}\n"
# Done
printf "${TAB_STR}\t}\n"
# </Right>
# <Back>
printf "${TAB_STR}\tKEY=\"5\" NOFORMAT \"       [5]       \" {\n"
## Back left
printf "${TAB_STR}\t\tKEY=\"1\" NOFORMAT \"<clr:234,209,174>        [4]     <cr>\" {\n"
# Back left left
printf "${TAB_STR}\t\t\tKEY=\"1\" NOFORMAT \" \" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
## Back left upper
printf "${TAB_STR}\t\t\tKEY=\"4\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT UPPER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT UPPER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
printf "${TAB_STR}\t\t\t}\n"
## Back left lower
printf "${TAB_STR}\t\t\tKEY=\"5\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT LOWER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT LOWER (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
# Done
printf "${TAB_STR}\t\t}\n"
## Back right
printf "${TAB_STR}\t\tKEY=\"3\" NOFORMAT \"[1]    [5]    [3]\" {\n"
### Back right right
printf "${TAB_STR}\t\t\tKEY=\"3\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK RIGHT (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK RIGHT (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
## Back right upper
printf "${TAB_STR}\t\t\tKEY=\"4\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK RIGHT UPPER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK RIGHT UPPER (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
## Back right lower
printf "${TAB_STR}\t\t\tKEY=\"5\" NOFORMAT \"\" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT LOWER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s RIGHT LOWER (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
printf "${TAB_STR}\t\t\t}\n"
# Done
printf "${TAB_STR}\t\t}\n"
## Back mid
printf "${TAB_STR}\t\tKEY=\"2\" NOFORMAT \"       [5]       \" {\n"
### Back mid mid
printf "${TAB_STR}\t\t\tKEY=\"2\" NOFORMAT \"       [4]       \" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK MID (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
### Done
printf "${TAB_STR}\t\t\t}\n"
### Back mid upper
printf "${TAB_STR}\t\t\tKEY=\"4\" NOFORMAT \"       [2]       \" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID UPPER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK MID UPPER (TEAM SIDE) (BIND)\" |\n" ${Amount} "$2"
done
### Done
printf "${TAB_STR}\t\t\t}\n"
### Back mid lower
printf "${TAB_STR}\t\t\tKEY=\"4\" NOFORMAT \"       [5]       \" {\n"
printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID LOWER (TEAM SIDE) (BIND)\" |\n" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team %s %s BACK MID LOWER (TEAM SIDE) (BIND)\" |\n" "${Amount}" "$2"
done
### Done
printf "${TAB_STR}\t\t\t}\n"
## Done
printf "${TAB_STR}\t\t}\n"
#</Back>
printf "${TAB_STR}\t}\n"
# Finished pos calls.
printf "${TAB_STR}}\n"