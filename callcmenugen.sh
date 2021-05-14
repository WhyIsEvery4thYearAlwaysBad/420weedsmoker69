#!/bin/bash
# Config
title="[Calls]"
ClassNames=("scout" "solly" "pyro" "demo" "heavy" "engi" "medic" "sniper" "spy" "medic Combo" "trap" 'sentry dispenser tele nest')
Weapons=( 'bonk! crit-A-Cola Mad\040Milk' 'Buff\040Banner battals conch gunboats'  'phlog Gas\040Passer' '' '' '' 'Stock\040Medigun kritz quickie vacc Solemn\040Vow' 'jarate' 'yer')
# end Config

# Function to generate position calls. I know this function can be optimized to not use 19 for loops, but that's too much work.
# $1 - The name of the thing to make pos calls for. 
# $2 - The entire CMenu name. Default val: Pos.
gen_pos_calls() {
	echo -e "\t\t\t\"${2:-[Pos]}\" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt	
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ] 
		then echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \"       [5]     [6]<B>\" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LEFT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK RIGHT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \"      [5]     <clr:255,100,100>[6]<B>\" {" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
	echo -e "\t\t\t}" >> callcmenu_script_result.txt
}

# 
# The main function body.

main() {
	echo -e "\"$title\" {" > callcmenu_script_result.txt
	# Get all classes
	for ClassID in {0..11..3}
	do
		if [ $ClassID -eq 9 ]
		then 
			echo -e "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/Builds]\" {" >> callcmenu_script_result.txt
		else
			echo -e "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/${ClassNames[ClassID+2]^}]\" {" >> callcmenu_script_result.txt
		fi

		# The actual calls
		for SubID in {0..2}
		do
			# Dont let the classid go beyond the allowed limit
			echo -e "\t\t\"[${ClassNames[ClassID+SubID]^}]\" {" >> callcmenu_script_result.txt
			# Generate position calls for all classes. Not buildings yet tho.
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				echo
			else
				gen_pos_calls "${ClassNames[ClassID+SubID]^^}"
			fi
			# Create "has weapon" calls ONLY if the class actually has special weapons defined.
			if [ ! ${#Weapons[ClassID+SubID]} -eq 0 ]
			then
				echo -e "\t\t\t\"[Weapons]\" {"  >> callcmenu_script_result.txt
				for WeaponGroup in ${Weapons[ClassID+SubID]}
				do
					for Weapon in ${WeaponGroup[@]}
					do
						echo -e "\t\t\t\t\"[${Weapon}]\" {"  >> callcmenu_script_result.txt
						for Amount in {1..9} 0
						do
								if [ $Amount -eq 1 ] 
								then
									echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ENEMY ${ClassNames[ClassID+SubID]} USE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
								else
									echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]}S USE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
								fi
						done
						echo -e "\t\t\t\t}"  >> callcmenu_script_result.txt
					done
				done
			# End Weapon calls
				echo -e "\t\t\t}" >> callcmenu_script_result.txt
			fi
			# Start Spy Disguises.
			if [ $ClassID -eq 6 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\t\"[Disguise]\" {"  >> callcmenu_script_result.txt
				for DisguiseID in {0..8..3}
				do
					echo -e "\t\t\t\t\"[${ClassNames[DisguiseID]^}/${ClassNames[DisguiseID+1]^}/${ClassNames[DisguiseID+2]^}]\" {" >> callcmenu_script_result.txt
					for SubDID in {0..2}
					do
						echo -e "\t\t\t\t\t\"[${ClassNames[DisguiseID+SubDID]^}]\" {" >> callcmenu_script_result.txt
						for Amount in {1..9} 0
						do
							if [ $Amount -eq 1 ]
							then
								echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team SPY ${ClassNames[DisguiseID+SubDID]^^} (BIND)\" |" >> callcmenu_script_result.txt
							else
								echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} SPY ${ClassNames[DisguiseID+SubDID]^^}S (BIND)\" |" >> callcmenu_script_result.txt
							fi
						done
						echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
					done
					echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
				done
				echo -e "\t\t\t\tBIND \"Dead Rang!\" \"say_team SPY DEAD RANG (BIND)\" |"  >> callcmenu_script_result.txt
				echo -e "\t\t\t\tBIND \"Spy!\" \"say_team SPY - CHECK BACKS! (BIND)\" |"  >> callcmenu_script_result.txt
				echo -e "\t\t\t}" >> callcmenu_script_result.txt
			fi
			# ^ End Spy Disguises
			# <Builds>
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				for Build in ${ClassNames[ClassID+SubID]}
				do
					echo -e "\t\t\t\"[${Build^}]\" {" >> callcmenu_script_result.txt
					# Generate position calls for buildings.
					gen_pos_calls "${Build^^}"
					# and for destroyed ones.
					gen_pos_calls "DESTROYED ${Build^^}" "[Destroyed]"
					echo -e "\t\t\t}" >> callcmenu_script_result.txt
				done
			fi
			# </Builds>
			# End class cmenu
			echo -e "\t\t}" >> callcmenu_script_result.txt
		done
		# End braces
		echo -e "\t}" >> callcmenu_script_result.txt
	done

	# Ending braces.
	echo -e "}" >> callcmenu_script_result.txt
}

main