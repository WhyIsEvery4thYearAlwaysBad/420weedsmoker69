#!/bin/bash
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
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
'grenade loch bomber boots jumper' \
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
# end Config

# Function to generate position calls with generic locations.
# $1 - The name of the thing to make pos calls for.
# $2 - Tab count
# $3 - The entire CMenu definition line. Default val: Pos.
gen_detailed_pos_calls() {
	TAB_STR="$2"
	printf "${TAB_STR}%s" "${3:-"\"[Pos]\" {"}"
	for Point in "BLU" "RED" "1st" "2nd" "3rd" "4th" "5th" "6th" "7th" "8th" "9th" "LAST"
	do
		if [ "$Point" == "BLU" ]
		then
			printf "${TAB_STR}\t\"[Spawn]\" {\n"
			./gen_pos_calls.sh "$1 ${Point^^}" "${1}S ${Point^^}" "${TAB_STR}\t\t" "\"[${Point}]\" {"
		elif [ "$Point" == "RED" ]
		then
			./gen_pos_calls.sh "$1 ${Point^^}" "${1}S ${Point^^}" "${TAB_STR}\t\t" "\"[${Point}]\" {"
			printf "${TAB_STR}\t}\n"
			printf "${TAB_STR}\t\"[Point]\" {\n"
		else 
			./gen_pos_calls.sh "$1 ${Point^^}" "${1}S ${Point^^}" "${TAB_STR}\t\t" "NOFORMAT \" \" {"
		fi
		
	done
	printf "${TAB_STR}\t}\n"
	./gen_pos_calls.sh "$1" "${1}S" "${TAB_STR}\t" "${3:-"\"[Pos]\" {"}"
	printf "${TAB_STR}}\n"
}

# The main function body.
main() {
	printf "\"$TITLE\" {\n"
	# Get all classes
	for ClassID in 0 3 6 9
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
		if [ $ClassID -eq 9 ]
		then
			printf "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/Builds]\" {\n"
		else
			printf "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/${ClassNames[ClassID+2]^}]\" {\n"
		fi

		# The actual calls
		for SubID in 0 1 2
		do
			# Dont let the classid go beyond the allowed limit
			# Generate position calls for all classes. Not buildings yet tho.
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				printf "\t\t\"[Builds]\" {\n"
			elif [ $ClassID -eq 9 ] && [ $SubID -eq 0 ]
			then
				printf "\t\t\"[Medic Combo]\" {\n"
				printf "\t\t\t\"[Scou/Solly/Pyr]\" {\n"
				gen_detailed_pos_calls "SCOUT-MED" "\t\t\t\t" "\"[Scou]\" {"
				gen_detailed_pos_calls "SOLLY-MED" "\t\t\t\t" "\"[Solly]\" {"
				gen_detailed_pos_calls "PYRO-MED" "\t\t\t\t" "\"[Pyr]\" {"
				printf "\t\t\t}\n"
				printf "\t\t\t\"[Dem/Heav/Eng]\" {\n"
				gen_detailed_pos_calls "DEMO-MED" "\t\t\t\t" "\"[Dem]\" {"
				gen_detailed_pos_calls "HEAVY-MED" "\t\t\t\t" "\"[Heav]\" {"
				gen_detailed_pos_calls "ENGI-MED" "\t\t\t\t" "\"[Eng]\" {"
				printf "\t\t\t}\n"
				printf "\t\t\t\"[Med/Snipe/Sp]\" {\n"
				gen_detailed_pos_calls "MED-MED" "\t\t\t\t" "\"[Med]\" {"
				gen_detailed_pos_calls "SNIPER-MED" "\t\t\t\t" "\"[Snipe]\" {"
				gen_detailed_pos_calls "SPY-MED" "\t\t\t\t" "\"[Sp]\" {"
				printf "\t\t\t}\n"
				gen_detailed_pos_calls "MEDIC COMBO" "\t\t\t" "\"[Unknown]\" {"
			else
				printf "\t\t\"[${ClassNames[ClassID+SubID]^}]\" {\n"
				gen_detailed_pos_calls "${ClassNames[ClassID+SubID]^^}" "\t\t\t"
			fi
			# Create "has weapon" calls ONLY if the class actually has special weapons defined.
			if [ $((ClassID+SubID)) -lt 9 ]
			then
				printf "\t\t\t\"[Weapons]\" {\n"
				# Primary Weapons
				printf "\t\t\t\t\"[Primary]\" {\n"
				for PrimaryWeaponGroup in ${Weapons[$(((ClassID+SubID)*3))]}
				do
					for Weapon in ${PrimaryWeaponGroup[@]}
					do
						printf "\t\t\t\t\t\"[${Weapon^}]\" {\n"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |\n"
						done
						printf "\t\t\t\t\t}\n"
					done
				done
				printf "\t\t\t\t}\n"
				# Secondary Weapons
				printf "\t\t\t\t\"[Secondary]\" {\n"
				for SecondWeaponGroup in ${Weapons[$((((ClassID+SubID)*3)+1))]}
				do
					for Weapon in ${SecondWeaponGroup[@]}
					do
						printf "\t\t\t\t\t\"[${Weapon^}]\" {\n"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |\n"
						done
						printf "\t\t\t\t\t}\n"
					done
				done
				printf "\t\t\t\t}\n"
				# Tertiary Weapons
				printf "\t\t\t\t\"[Tertiary]\" {\n"
				for TertiaryWeaponGroup in ${Weapons[$((((ClassID+SubID)*3)+2))]}
				do
					for Weapon in ${TertiaryWeaponGroup[@]}
					do
						printf "\t\t\t\t\t\"[${Weapon^}]\" {\n"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${ClassNames[ClassID+SubID]^^} USE ${Weapon^^} (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S USE ${Weapon^^} (BIND)\" |\n"
						done
						printf "\t\t\t\t\t}\n"
					done
				done
				printf "\t\t\t\t}\n"
				# End Weapon calls
				printf "\t\t\t}\n"
			fi
			# Start Spy Disguises.
			if [ $ClassID -eq 6 ] && [ $SubID -eq 2 ]
			then
				printf "\t\t\t\"[Disguise]\" {\n"
				for DisguiseID in 0 3 6
				do
					printf "\t\t\t\t\"[${ClassNames[DisguiseID]^}/${ClassNames[DisguiseID+1]^}/${ClassNames[DisguiseID+2]^}]\" {\n"
					for SubDID in 0 2
					do
						printf "\t\t\t\t\t\"[${ClassNames[DisguiseID+SubDID]^}]\" {\n"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team SPY ${ClassNames[DisguiseID+SubDID]^^} (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team ${Amount} SPY ${ClassNames[DisguiseID+SubDID]^^}S (BIND)\" |\n"
						done
						printf "\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t}\n"
				done
				printf "\t\t\t\tBIND \"Dead Rang!\" \"say_team SPY DEAD RANG (BIND)\" |\n"
				printf "\t\t\t\tBIND \"Spy!\" \"say_team SPY - CHECK BACKS! (BIND)\" |\n"
				printf "\t\t\t}\n"
			fi
			# ^ End Spy Disguises
			# <Builds>
			if [ $ClassID -eq 9 ] && [ $SubID -eq 2 ]
			then
				for Build in ${ClassNames[ClassID+SubID]}
				do
					printf "\t\t\t\"[${Build^}]\" {\n"
					# Generate position calls for buildings.
					gen_detailed_pos_calls "${Build^^}" "\t\t\t\t"
					# and for destroyed ones.
					gen_detailed_pos_calls "DESTROYED ${Build^^}" "\t\t\t\t" "\"[Destroyed]\" {"
					printf "\t\t\t}\n"
				done
			fi
			# </Builds>
			# <Phlog/GP calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 2 ]
			then
				printf "\t\t\t\"[Meters]\" {\n"
				for Meter in "Phlog" "Gas\040Passer"
				do
					printf "\t\t\t\t\"[${Meter}]\" {\n"
					printf "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team ENEMY ${Meter^^} PREPPED (BIND)\" |\n"
					for Num in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY ${Meter^^}S PREPPED (BIND)\" |\n"
					done
					printf "\t\t\t\t}\n"
				done
				printf "\t\t\t}\n"
			fi
			# </Phlog/GP calls>
			# <Banner Calls>
			if [ $ClassID -eq 0 ] && [ $SubID -eq 1 ]
			then
				printf "\t\t\t\"[Banners]\" {\n"
				for Banner in "Buff\040Banner" "Battal" "Conch"
				do
					printf "\t\t\t\t\"[${Banner}]\" {\n"
					printf "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY ${Banner^^} PREPPED (BIND)\" |\n"
					for Num in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY ${Banner^^}S PREPPED (BIND)\" |\n"
					done
					printf "\t\t\t\t}\n"
				done
				printf "\t\t\t}\n"
			fi
			# </Banner Calls>
			# <Über calls>
			if [ $ClassID -eq 6 ] && [ $SubID -eq 0 ]
			then
				printf "\t\t\t\"[Über]\" {\n"
				for UberType in "stock" "kritz" "quickie" "vacc" "unknown"
				do
					printf "\t\t\t\t\"[%s]\" {\n" "${UberType^}"
					printf "\t\t\t\t\t\"[Value]\" {\n"
					printf "\t\t\t\t\t\t\"[10-30%%]\" {\n"
					for UberValue in {1..3}0
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER %s%% (BIND)\" |\n" "${UberType^^}" "$UberValue"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %s ENEMY %s ÜBERS %s%% (BIND)\" |\n" "$Amount" "${UberType^^}" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[40-60%%]\" {\n"
					for UberValue in {4..6}0
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER %s%% (BIND)\" |\n" "${UberType^^}" "$UberValue"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s%% (BIND)\" |\n" $Amount "${UberType^^}" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[70-90%%]\" {\n"
					for UberValue in {7..9}0
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY ${UberType^^} ÜBER $UberValue%% (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s%% (BIND)\" |\n" $Amount "${UberType^^}" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[100%%]\" {\n"
					printf "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY ${UberType^^} ÜBERS 100%% (BIND)\" |\n"
					for Amount in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS 100%% (BIND)\" |\n" "$Amount" "${UberType^^}"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t}\n"
					for Verb in 'popped' 'dropped' 'faked'
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${Verb^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team ENEMY %s ÜBER %s (BIND)\" |\n" "${UberType^^}" "${Verb^^}"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s (BIND)\" |\n" ${Amount} "${UberType^^}" "${Verb^^}"
						done
						printf "\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t}\n"
				done
				printf "\t\t\t}\n"
			fi
			# </Über>
			# End class cmenu
			printf "\t\t}\n"
		done
		# End braces
		printf "\t}\n"
	done

	# Ending braces.
	printf "}\n\n"
}

main
