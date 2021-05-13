cd ~/Documents/Projects/420weedsmoker69
# Config
title="[Calls]"
ClassNames=("Scout" "Solly" "Pyro" "Demo" "Heavy" "Engi" "Medic" "Sniper" "Spy" "Medic Combo" "Trap" "Nest")
ClassNamesUpper=("SCOUT" "SOLLY" "PYRO" "DEMO" "HEAVY" "ENGI" "MEDIC" "SNIPER" "SPY" "MEDIC COMBO" "TRAP" "NEST")
# end Config
echo -e "\"$title\" {" > callcmenu_script_result.txt
# Get all classes
for ClassID in {0..10..3}
do
	echo -e "\t\"[${ClassNames[ClassID]}/${ClassNames[ClassID+1]}/${ClassNames[ClassID+2]}]\" {" >> callcmenu_script_result.txt

	# The actual calls
	for SubID in {0..2}
	do
		# Dont let the classid go beyond the allowed limit
		echo -e "\t\t\"[${ClassNames[ClassID+SubID]}]\" {" >> callcmenu_script_result.txt
		# Position calls
		echo -e "\t\t\t\"[Pos]\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"       [5]     [6]<B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t/*" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t[1 : UPPER BACK]\t[4] [3 : UPPER BACK]" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\t\t[1] [2] [3]" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t[1 : LOWER BACK]\t[5] [2 : LOWER BACK]" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t*/" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"      [5]     <clr:255,100,100>[6]<B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>How many?<B>\" \"say_team ${ClassNamesUpper[ClassID+SubID]} BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 2 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 3 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 4 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 5 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 6 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 7 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 8 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 9 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team 0 ${ClassNamesUpper[ClassID+SubID]}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		# End position calls
		echo -e "\t\t\t}" >> callcmenu_script_result.txt
		# End class cmenu
		echo -e "\t\t}" >> callcmenu_script_result.txt
	done
	# End braces
	echo -e "\t}" >> callcmenu_script_result.txt
done

# Ending braces.
echo -e "}" >> callcmenu_script_result.txt