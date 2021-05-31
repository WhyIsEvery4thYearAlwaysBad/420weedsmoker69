#!/bin/bash
# Config
title="[Calls]"
ClassNames=("scout" "solly" "pyro" "demo" "heavy" "engi" "medic" "sniper" "spy" "medic Combo" "trap" 'sentry dispenser tele nest')
Weapons=( 'bonk! crit-A-Cola Mad\040Milk' 'Buff\040Banner battals conch gunboats whip'  'phlog Gas\040Passer' '' 'foS GRU' 'rescue\040Ranger frontier\040Justice wrangler short\040Circuit eureka\040Effect jag' 'Stock\040Medigun kritz quickie vacc Solemn\040Vow' 'jarate' 'yer')
# end Config

# Function to generate position calls. I know this function can be optimized to not use 19 for loops, but that's too much work.
# $1 - The name of the thing to make pos calls for.
# $2 - Tab count
# $3 - The entire CMenu name. Default val: Pos.
gen_pos_calls() {
	echo -e "${2}\"${3:-[Pos]}\" {" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "${2}\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "${2}\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "${2}\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "${2}\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \"       [5]     [6]<B>\" {" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LEFT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK RIGHT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \"      [5]     <clr:255,100,100>[6]<B>\" {" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]     <cr>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
	echo -e "${2}\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
	for Amount in {1..9} 0
	do
		if [ $Amount -eq 1 ]
		then
			echo -e "${2}\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team $1 BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		else
			echo -e "${2}\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${1}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
		fi
	done
	echo -e "${2}\t\t}" >> callcmenu_script_result.txt
	echo -e "${2}\t}" >> callcmenu_script_result.txt
	echo -e "${2}}" >> callcmenu_script_result.txt
}

# The main function body.
main() {
	echo -e "\"$title\" {" > callcmenu_script_result.txt
	# Get all classes
	for ClassID in {0..11..3}
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
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
			# Generate position calls for all classes. Not buildings yet tho.
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\"[Builds]\" {" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\"[${ClassNames[ClassID+SubID]^}]\" {" >> callcmenu_script_result.txt
				gen_pos_calls "${ClassNames[ClassID+SubID]^^}" "\t\t\t"
			fi
			# Create "has weapon" calls ONLY if the class actually has special weapons defined.
			if [ ! ${#Weapons[ClassID+SubID]} -eq 0 ]
			then
				echo -e "\t\t\t\"[Weapons]\" {"  >> callcmenu_script_result.txt
				for WeaponGroup in ${Weapons[ClassID+SubID]}
				do
					for Weapon in ${WeaponGroup[@]}
					do
						echo -e "\t\t\t\t\"[${Weapon^}]\" {"  >> callcmenu_script_result.txt
						echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
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
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team SPY ${ClassNames[DisguiseID+SubDID]^^} (BIND)\" |" >> callcmenu_script_result.txt
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} SPY ${ClassNames[DisguiseID+SubDID]^^}S (BIND)\" |" >> callcmenu_script_result.txt
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
					gen_pos_calls "${Build^^}" "\t\t\t\t"
					# and for destroyed ones.
					gen_pos_calls "DESTROYED ${Build^^}" "\t\t\t\t" "[Destroyed]"
					echo -e "\t\t\t}" >> callcmenu_script_result.txt
				done
			fi
			# </Builds>
			# <Phlog/GP calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\t\"[Meters]\" {" >> callcmenu_script_result.txt
				for Meter in "Phlog" "Gas\040Passer"
				do
					echo -e "\t\t\t\t\"[${Meter}]\" {" >> callcmenu_script_result.txt
					echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ENEMY ${Meter^^} PREPPED (BIND)\" |" >> callcmenu_script_result.txt
					for Num in {2..9} 0
					do
						echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team $Num ENEMY ${Meter^^}S PREPPED (BIND)\" |" >> callcmenu_script_result.txt
					done
					echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
				done
				echo -e "\t\t\t}" >> callcmenu_script_result.txt
			fi
			# </Phlog/GP calls>
			# <Banner Calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 1 ]
			then
				echo -e "\t\t\t\"[Banners]\" {" >> callcmenu_script_result.txt
				for Banner in "Buff\040Banner" "Battal" "Conch"
				do
					echo -e "\t\t\t\t\"[${Banner}]\" {" >> callcmenu_script_result.txt
					echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ENEMY ${Banner^^} PREPPED (BIND)\" |" >> callcmenu_script_result.txt
					for Num in {2..9} 0
					do 
						echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team $Num ENEMY ${Banner^^}S PREPPED (BIND)\" |" >> callcmenu_script_result.txt
					done
					echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
				done
				echo -e "\t\t\t}" >> callcmenu_script_result.txt
			fi
			# </Banner Calls>
			# <Über calls>
			if [ $ClassID -eq 6 ] && [ $SubID -eq 0 ]
			then
				echo -e "\t\t\t\"[Über]\" {" >> callcmenu_script_result.txt
				for UberType in "stock" "kritz" "quickie" "vacc"
				do
					echo -e "\t\t\t\t\"[${UberType^}]\" {" >> callcmenu_script_result.txt
					for Digit1 in {1..9} 0
					do
						if [ $Digit1 -eq 1 ]
						then
							echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>_<B>\" {" >> callcmenu_script_result.txt
						else
							echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
						fi
						for Digit2 in {1..9} 0
						do
							if [ $Digit2 -eq 1 ]
							then
								if [ $Digit1 -eq 0 ]
								then
									echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>_<B>\" {" >> callcmenu_script_result.txt
								else
									echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>${Digit1}_<B>\" {" >> callcmenu_script_result.txt
								fi
							else
								echo -e "\t\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
							fi
							if [ $Digit1 -eq 0 ]
							then
								echo -e "\t\t\t\t\t\t\tKEY = \"ENTER\" NOFORMAT \"<clr:234,209,174><B>${Digit2}_<B>\" {" >> callcmenu_script_result.txt
								for Amount in {1..9} 0
								do
									if [ $Amount -eq 1 ]
									then
										echo -e "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>Amount: _<B>\" \"say_team ENEMY ${UberType^^} ÜBER ${Digit2}% (BIND)\" |" >> callcmenu_script_result.txt
									else
										echo -e "\t\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${UberType^^} ÜBERS ${Digit2}% (BIND)\" |" >> callcmenu_script_result.txt
									fi
								done
								echo -e "\t\t\t\t\t\t\t}" >> callcmenu_script_result.txt
							else
								echo -e "\t\t\t\t\t\t\tKEY = \"ENTER\" NOFORMAT \"<clr:234,209,174><B>${Digit1}${Digit2}_<B>\" {" >> callcmenu_script_result.txt
								echo -e "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>Amount: _<B>\" \"say_team ENEMY ${UberType^^} ÜBER ${Digit1}${Digit2}% (BIND)\" |" >> callcmenu_script_result.txt
								for Amount in {2..9} 0
								do
									echo -e "\t\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${UberType^^} ÜBERS ${Digit1}${Digit2}% (BIND)\" |" >> callcmenu_script_result.txt
								done
								echo -e "\t\t\t\t\t\t\t}" >> callcmenu_script_result.txt
							fi
							# Make 100% über bind
							if [ $Digit1 -eq 1 ] && [ $Digit2 -eq 0 ]
							then
								echo -e "\t\t\t\t\t\t\tKEY = \"0\" NOFORMAT \" \" {" >> callcmenu_script_result.txt
								echo -e "\t\t\t\t\t\t\t\tKEY = \"ENTER\" NOFORMAT \"<clr:234,209,174><B>${Digit1}${Digit2}0_<B>\" {" >> callcmenu_script_result.txt
								echo -e "\t\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>Amount: _<B>\" \"say_team ENEMY ${UberType^^} ÜBER 100% (BIND)\" |" >> callcmenu_script_result.txt
								for Amount in {2..9} 0
								do
									echo -e "\t\t\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${UberType^^} ÜBERS 100% (BIND)\" |" >> callcmenu_script_result.txt
								done
								echo -e "\t\t\t\t\t\t\t\t}" >> callcmenu_script_result.txt
								echo -e "\t\t\t\t\t\t\t}" >> callcmenu_script_result.txt
							fi
							echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
						done
						echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
					done
					echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
				done
				echo -e "\t\t\t}" >> callcmenu_script_result.txt
			fi
			# </Über>
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