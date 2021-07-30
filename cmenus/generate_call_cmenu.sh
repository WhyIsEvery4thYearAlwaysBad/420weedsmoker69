#!/bin/bash
# This scripts generates the [Calls] cmenu through output.
# Config
TITLE="[Calls]"
ClassNames=("scout" "solly" "pyro" "demo" "heavy" "engi" "medic" "sniper" "spy" "medic Combo" "trap" 'sentry dispenser tele nest')
Weapons=( 'scattergun fan shortstop soda\040popper bfb back\040scatter' \
'pistol winger pbpp cleaver milk bonk caC'  \
'bat sand assassin cane bash stick fow atom' \
'stock\040rl origin direct black\040box rjumper liberty mangler beggars striker' \
'shotgun reserve buff battals conch gunboats treads bison bjumper panic' \
'shovel i-pick capper anime-sword whip marketeer d-pick' \
'flamethrower backburner degreaser phlog dragons' \
'shotgun panic reserve flare detonator melter scorch gas' \
'stock\040axe axtinguisher hammer powerjack back\040scratcher fragment 3° neon hand' \
'grenade' 'loch' 'bomber' 'boots' 'jumper' \
'stick-launcher scores quickiebomb sjumper bjumper' \
'bottle eyelander cutter capper caber claid anime-sword persian' \
'minigun natascha brass tomislav heater' \
'shotgun panic family sandvich banana snickers steak' \
'fists crit-gloves gru warrior fos evictor holipunch' \
'shotgun panic frontier widowmaker pomp res.\040ranger' \
'pistol wrangler short\040circuit' \
'wrench gunslinger eureka jag southern' \
'crossbow blut overdose stock\040syringe' \
'medigun kritz quickie vacc' \
'übersaw vitasaw vow amp bonesaw' \
'sniper bow sydney bazaar machina heatmaker classic' \
'smg cleaners jarate razorback fire-shield camper' \
'kukuri bushwacka shahanshah shiv' \
'revolver diamondback letranger ambassador enforcer' \
'knife kunai earner spycicle' \
'stock\040watch cad ringer sapper rtr' \
)
declare -a ScoutPrimaries=('scattergun' 'fan')
# end Config

# Function to generate position calls. I know this function can be optimized to not use 19 for loops, but that's too much work.
# $1 - The name of the thing to make pos calls for.
# $2 - Tab count
# $3 - The entire CMenu name. Default val: Pos.
gen_pos_calls() {
	TAB_STR=$2
	echo -e "${TAB_STR}\"${3:-[Pos]}\" {"
	TAB_STR+="\040"
	for Point in "BLU Spawn " "RED Spawn " "1st " "2nd " "3rd " {4..9}"th\040" "LAST " REG_POS
	do
		if [ "$Point" == "BLU Spawn " ]
		then
			echo -e "${TAB_STR}\"[Spawn]\" {"
			echo -e "${TAB_STR}\t\"[${Point%" Spawn "}]\" {"
		elif [ "$Point" == "RED Spawn " ]
		then
			echo -e "${TAB_STR}\t\"[${Point%" Spawn "}]\" {"
		elif [ "$Point" == "1st " ]
		then
			echo -e "${TAB_STR}\"[Point]\" {"
			echo -e "${TAB_STR}\t\"[${Point% }]\" {"
		elif [ "$Point" == "REG_POS" ]
		then
			TAB_STR=${TAB_STR%\011}
			Point=""
			echo -e "${TAB_STR}\"[Pos]\" {"
		else
			echo -e "${TAB_STR}\t\"[${Point% }]\" {"
		fi
		echo -e "${TAB_STR}\t\tNOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}MID (BIND)\" |"
			else echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}MID (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t\tNOFORMAT \" \" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}RIGHT (TEAM SIDE) (BIND)\" |"
			else echo -e "${TAB_STR}\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t\tNOFORMAT \"\" {"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}UPPER LEFT (TEAM SIDE) (BIND)\" |"
			else echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}UPPER LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"        [5]     \" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}UPPER RIGHT (TEAM SIDE) (BIND)\" |"
			else echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}UPPER RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}UPPER (TEAM SIDE) (BIND)\" |"
			else echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}UPPER (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t\tNOFORMAT \"       [5]     [6]\" {"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"<clr:234,209,174>        [4]     <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}LOWER LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}LOWER LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}LOWER RIGHT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}LOWER RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"[1]    [5]    [3]\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}LOWER (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}LOWER (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t\tNOFORMAT \" \" {"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"<clr:234,209,174>        [4]      <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK LEFT LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK MID LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK MID LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \" \" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK RIGHT LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \" \" {"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"<clr:234,209,174>[1]    [4]    [3]<cr> <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK UPPER LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK UPPER LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"        [5]     \" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK UPPER (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK UPPER (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \"      [5]     <clr:255,100,100>[6]\" {"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"<clr:234,209,174>        [4]     <cr>\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK LOWER LEFT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK LOWER LEFT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |"
		echo -e "${TAB_STR}\t\t\t\tNOFORMAT \"[1]    [5]    [3]\" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK LOWER (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK LOWER (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t\t}"
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t\tNOFORMAT \" \" {"
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team $1 ${Point^^}BACK (TEAM SIDE) (BIND)\" |"
			else
				echo -e "${TAB_STR}\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ${1}S ${Point^^}BACK (TEAM SIDE) (BIND)\" |"
			fi
		done
		echo -e "${TAB_STR}\t\t\t}"
		echo -e "${TAB_STR}\t\t}"
		echo -e "${TAB_STR}\t}"
		if [ "$Point" == "RED Spawn " ] || [ "$Point" == "LAST " ]
		then
			echo -e "${TAB_STR}}"
		fi
	done
	echo -e "${TAB_STR}}"
}

# The main function body.
main() {
	echo -e "\"$TITLE\" {"
	# Get all classes
	for ClassID in {0..11..3}
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
		if [ $ClassID -eq 9 ]
		then
			echo -e "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/Builds]\" {"
		else
			echo -e "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/${ClassNames[ClassID+2]^}]\" {"
		fi

		# The actual calls
		for SubID in {0..2}
		do
			# Dont let the classid go beyond the allowed limit
			# Generate position calls for all classes. Not buildings yet tho.
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\"[Builds]\" {"
			else
				echo -e "\t\t\"[${ClassNames[ClassID+SubID]^}]\" {"
				gen_pos_calls "${ClassNames[ClassID+SubID]^^}" "\t\t\t"
			fi
			# Create "has weapon" calls ONLY if the class actually has special weapons defined.
			if [ ! ${#Weapons[ClassID+SubID]} -eq 0 ]
			then
				echo -e "\t\t\t\"[Weapons]\" {"
				# Primary Weapons
				echo -e "\t\t\t\t\"[Primary]\" {"
				for PrimaryWeaponGroup in ${Weapons[$(((ClassID+SubID)*3))]}
				do
					for Weapon in ${PrimaryWeaponGroup[@]}
					do
						echo -e "\t\t\t\t\t\"[${Weapon^}]\" {"
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |"
						done
						echo -e "\t\t\t\t\t}"
					done
				done
				echo -e "\t\t\t\t}"
				# Secondary Weapons
				echo -e "\t\t\t\t\"[Secondary]\" {"
				for SecondWeaponGroup in ${Weapons[$(((ClassID+SubID)*3+1))]}
				do
					for Weapon in ${SecondWeaponGroup[@]}
					do
						echo -e "\t\t\t\t\t\"[${Weapon^}]\" {"
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |"
						done
						echo -e "\t\t\t\t\t}"
					done
				done
				echo -e "\t\t\t\t}"
				# Tertiary Weapons
				echo -e "\t\t\t\t\"[Tertiary]\" {"
				for TertiaryWeaponGroup in ${Weapons[$(((ClassID+SubID)*3+2))]}
				do
					for Weapon in ${TertiaryWeaponGroup[@]}
					do
						echo -e "\t\t\t\t\t\"[${Weapon^}]\" {"
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |"
						done
						echo -e "\t\t\t\t\t}"
					done
				done
				echo -e "\t\t\t\t}"
				# End Weapon calls
				echo -e "\t\t\t}"
			fi
			# Start Spy Disguises.
			if [ $ClassID -eq 6 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\t\"[Disguise]\" {"
				for DisguiseID in {0..8..3}
				do
					echo -e "\t\t\t\t\"[${ClassNames[DisguiseID]^}/${ClassNames[DisguiseID+1]^}/${ClassNames[DisguiseID+2]^}]\" {"
					for SubDID in {0..2}
					do
						echo -e "\t\t\t\t\t\"[${ClassNames[DisguiseID+SubDID]^}]\" {"
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team SPY ${ClassNames[DisguiseID+SubDID]^^} (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} SPY ${ClassNames[DisguiseID+SubDID]^^}S (BIND)\" |"
						done
						echo -e "\t\t\t\t\t}"
					done
					echo -e "\t\t\t\t}"
				done
				echo -e "\t\t\t\tBIND \"Dead Rang!\" \"say_team SPY DEAD RANG (BIND)\" |"
				echo -e "\t\t\t\tBIND \"Spy!\" \"say_team SPY - CHECK BACKS! (BIND)\" |"
				echo -e "\t\t\t}"
			fi
			# ^ End Spy Disguises
			# <Builds>
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				for Build in ${ClassNames[ClassID+SubID]}
				do
					echo -e "\t\t\t\"[${Build^}]\" {"
					# Generate position calls for buildings.
					gen_pos_calls "${Build^^}" "\t\t\t\t"
					# and for destroyed ones.
					gen_pos_calls "DESTROYED ${Build^^}" "\t\t\t\t" "[Destroyed]"
					echo -e "\t\t\t}"
				done
			fi
			# </Builds>
			# <Phlog/GP calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 2 ]
			then
				echo -e "\t\t\t\"[Meters]\" {"
				for Meter in "Phlog" "Gas\040Passer"
				do
					echo -e "\t\t\t\t\"[${Meter}]\" {"
					echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${Meter^^} PREPPED (BIND)\" |"
					for Num in {2..9} 0
					do
						echo -e "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY ${Meter^^}S PREPPED (BIND)\" |"
					done
					echo -e "\t\t\t\t}"
				done
				echo -e "\t\t\t}"
			fi
			# </Phlog/GP calls>
			# <Banner Calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 1 ]
			then
				echo -e "\t\t\t\"[Banners]\" {"
				for Banner in "Buff\040Banner" "Battal" "Conch"
				do
					echo -e "\t\t\t\t\"[${Banner}]\" {"
					echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY ${Banner^^} PREPPED (BIND)\" |"
					for Num in {2..9} 0
					do
						echo -e "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY ${Banner^^}S PREPPED (BIND)\" |"
					done
					echo -e "\t\t\t\t}"
				done
				echo -e "\t\t\t}"
			fi
			# </Banner Calls>
			# <Über calls>
			if [ $ClassID -eq 6 ] && [ $SubID -eq 0 ]
			then
				echo -e "\t\t\t\"[Über]\" {"
				for UberType in "stock" "kritz" "quickie" "vacc" "unknown"
				do
					echo -e "\t\t\t\t\"[${UberType^}]\" {"
					echo -e "\t\t\t\t\t\"[Value]\" {"
					echo -e "\t\t\t\t\t\t\"[10-30%]\" {"
					for UberValue in {1..3}0
					do
						echo -e "\t\t\t\t\t\t\t\"$UberValue%\" {"
						echo -e "\t\t\t\t\t\t\t\tBIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\t\t\tBIND \"\" \"say_team $Amount ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						done
						echo -e "\t\t\t\t\t\t\t}"
					done
					echo -e "\t\t\t\t\t\t}"
					echo -e "\t\t\t\t\t\t\"[40-60%]\" {"
					for UberValue in {4..6}0
					do
						echo -e "\t\t\t\t\t\t\t\"$UberValue%\" {"
						echo -e "\t\t\t\t\t\t\tBIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\t\tBIND \"\" \"say_team $Amount ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						done
						echo -e "\t\t\t\t\t\t\t}"
					done
					echo -e "\t\t\t\t\t\t}"
					echo -e "\t\t\t\t\t\t\"[70-90%]\" {"
					for UberValue in {7..9}0
					do
						echo -e "\t\t\t\t\t\t\t\"$UberValue%\" {"
						echo -e "\t\t\t\t\t\t\t\tBIND \"$UberValue%\" \"say_team 1 ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\t\tBIND \"$UberValue%\" \"say_team $Amount ENEMY ${UberType^^} ÜBERS $UberValue% (BIND)\" |"
						done
						echo -e "\t\t\t\t\t\t\t}"
					done
					echo -e "\t\t\t\t\t\t}"
					echo -e "\t\t\t\t\t\t\"[100%]\" {"
					echo -e "\t\t\t\t\t\t\tBIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY ${UberType^^} ÜBERS 100% (BIND)\" |"
					for Amount in {2..9} 0
					do
						echo -e "\t\t\t\t\t\t\tBIND \"\" \"say_team $Amount ENEMY ${UberType^^} ÜBERS 100% (BIND)\" |"
					done
					echo -e "\t\t\t\t\t\t}"
					echo -e "\t\t\t\t\t}"
					for Verb in 'popped' 'dropped' 'faked'
					do
						echo -e "\t\t\t\t\t\"[${Verb^}]\" {"
						echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team ENEMY ÜBER ${Verb^^} (BIND)\" |"
						for Amount in {2..9} 0
						do
							echo -e "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ÜBERS ${Verb^^} (BIND)\" |"
						done
						echo -e "\t\t\t\t\t}"
					done
					echo -e "\t\t\t\t}"
				done
				echo -e "\t\t\t}"
			fi
			# </Über>
			# End class cmenu
			echo -e "\t\t}"
		done
		# End braces
		echo -e "\t}"
	done

	# Ending braces.
	echo -e "}\n"
}

main
