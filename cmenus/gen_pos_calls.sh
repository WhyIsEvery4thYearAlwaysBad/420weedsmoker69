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
printf '%b%s\n' "$TAB_STR" "${4:-"\"[Pos]\" {"}"
# Positional directions.
# In front
printf '%b\tKEY="4" NOFORMAT "<clr:234,209,174>        [4]      <cr>" {\n' "$TAB_STR"
## In front left
printf "%b\t\tKEY=\"1\" NOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {\n" "$TAB_STR"
### In front left left
printf "%b\t\t\tNOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front left upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \" \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front left lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \" \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Done
printf "%b\t\t}\n" "$TAB_STR"
## In front right
printf "%b\t\tKEY=\"3\" NOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> \" {\n" "$TAB_STR"
### In front right right
printf "%b\t\t\tKEY=\"3\" NOFORMAT \"<clr:234,209,174>       [5]       <cr> \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %s %s FRONT RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front right upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %s %s FRONT RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front right lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT RIGHT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %s %s FRONT RIGHT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Done.
printf "%b\t\t}" "$TAB_STR"
## In front mid
printf "%b\t\tKEY=\"2\" NOFORMAT \"\" {\n" "$TAB_STR"
### In front mid mid
printf "%b\t\t\tKEY=\"2\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT MID (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT MID (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front mid upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT MID UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT MID UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
### In front mid lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s FRONT MID LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s FRONT MID LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Done
printf "%b\t\t}\n" "$TAB_STR"
# Done
printf "%b\t}\n" "$TAB_STR"
# </Front>
# <Mid>
printf "%b\tKEY=\"2\" NOFORMAT \"[1]    [2]    [3]<cr>\" {\n" "$TAB_STR"
# Mid mid
printf "%b\t\tKEY=\"2\" NOFORMAT \"<clr:234,209,174>       [5]       <cr>\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %i %s MID (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
# Mid upper
printf "%b\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s MID UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
# Mid lower
printf "%b\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s MID LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s MID LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
printf "%b\t}\n" "$TAB_STR"
# </Mid>
# <Left>
printf "%b\tKEY=\"1\" NOFORMAT \" \" {\n" "$TAB_STR"
# Left left
printf "%b\t\tKEY=\"1\" NOFORMAT \" \" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
## Left upper
printf "%b\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
## Left lower
printf "%b\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
# Done
printf "%b\t}\n" "$TAB_STR"
# </Left>
# <Right>
printf "%b\tKEY=\"3\" NOFORMAT \" \" {\n" "$TAB_STR"
# Right right
printf "%b\t\tKEY=\"3\" NOFORMAT \" \" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
## Right upper
printf "%b\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
## Right lower
printf "%b\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s RIGHT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\tNOFORMAT BIND \"\" \"say_team %s %s RIGHT LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t}\n" "$TAB_STR"
# Done
printf "%b\t}\n" "$TAB_STR"
# </Right>
# <Back>
printf "%b\tKEY=\"5\" NOFORMAT \"       [5]       \" {\n" "$TAB_STR"
## Back left
printf "%b\t\tKEY=\"1\" NOFORMAT \"<clr:234,209,174>        [4]     <cr>\" {\n" "$TAB_STR"
# Back left left
printf "%b\t\t\tKEY=\"1\" NOFORMAT \" \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Back left upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Back left lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK LEFT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
# Done
printf "%b\t\t}\n" "$TAB_STR"
## Back right
printf "%b\t\tKEY=\"3\" NOFORMAT \"[1]    [5]    [3]\" {\n" "$TAB_STR"
### Back right right
printf "%b\t\t\tKEY=\"3\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK RIGHT (<-TEAM SIDE) (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Back right upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK RIGHT (<-TEAM SIDE) UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
## Back right lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \"\" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK RIGHT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK RIGHT (<-TEAM SIDE) LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
printf "%b\t\t\t}\n" "$TAB_STR"
# Done
printf "%b\t\t}\n" "$TAB_STR"
## Back mid
printf "%b\t\tKEY=\"2\" NOFORMAT \"       [5]       \" {\n" "$TAB_STR"
### Back mid mid
printf "%b\t\t\tKEY=\"2\" NOFORMAT \"       [4]       \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK MID (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
### Done
printf "%b\t\t\t}\n" "$TAB_STR"
### Back mid upper
printf "%b\t\t\tKEY=\"4\" NOFORMAT \"       [2]       \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID UPPER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %i %s BACK MID UPPER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
### Done
printf "%b\t\t\t}\n" "$TAB_STR"
### Back mid lower
printf "%b\t\t\tKEY=\"5\" NOFORMAT \"       [5]       \" {\n" "$TAB_STR"
printf "%b\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team %s BACK MID LOWER (BIND)\" |\n" "$TAB_STR" "$1"
for Amount in 2 3 4 5 6 7 8 9 0
do
	printf "%b\t\t\t\tNOFORMAT BIND \"\" \"say_team %s %s BACK MID LOWER (BIND)\" |\n" "$TAB_STR" "$Amount" "$2"
done
### Done
printf "%b\t\t\t}\n"  "$TAB_STR"
## Done
printf "%b\t\t}\n" "$TAB_STR"
#</Back>
printf "%b\t}\n" "$TAB_STR"
# Finished pos calls.
printf "%b}\n" "$TAB_STR"
