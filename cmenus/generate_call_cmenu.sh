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
'stick-launcher scores quickiebomb sjumper shield bjumper' \
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
'knife kunai earner spycicle yer' \
'stock\040watch cad ringer sapper rtr' \
)
# end Config

# Function to generate position calls with generic locations.
# $1 - The name of the thing to make pos calls for. (Singular)
# $2 - The name of the thing to make pos calls for. (Plural)
# $3 - Tab count
# $4 - The entire CMenu definition line. Default val: Pos.
gen_detailed_pos_calls() {
	TAB_STR="$3"
	printf "%bs" "${TAB_STR}${4:-"\"[Pos]\" {"}"
	for Point in "BLU Spawn" "RED Spawn" "1st" "2nd" "3rd" "4th" "5th" "6th" "7th" "8th" "9th" "LAST"
	do
		if [ "$Point" == "BLU Spawn" ]
		then
			printf "%b\t\"[Spawn]\" {\n" "${TAB_STR}"
			./gen_pos_calls.sh "$1 $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "\"[${Point%" Spawn "}]\" {"
		elif [ "$Point" == "RED Spawn" ]
		then
			./gen_pos_calls.sh "$1 $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "\"[${Point%" Spawn "}]\" {"
			printf "%b\t}\n" "${TAB_STR}"
			printf "%b\t\"[Point]\" {\n" "${TAB_STR}"
		else 
			./gen_pos_calls.sh "$1 $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "NOFORMAT \" \" {"
		fi
		
	done
	printf "%b\t}\n" "${TAB_STR}"
	./gen_pos_calls.sh "$1" "$2" "${TAB_STR}\t"
	printf "%b}\n" "${TAB_STR}"
}

# The main function body.
main() {
	printf "\"%s\" {\n" "$TITLE"
	# Get all classes
	for ClassID in 0 3 6 9
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
		if [ $ClassID -eq 9 ]
		then
			printf "\t\"[%s/%s/Builds]\" {\n" "${ClassNames[ClassID]^}" "${ClassNames[ClassID+1]^}"
		else
			printf "\t\"[%s/%s/%s]\" {\n" "${ClassNames[ClassID]^}" "${ClassNames[ClassID+1]^}" "${ClassNames[ClassID+2]^}"
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
				gen_detailed_pos_calls "1 SCOUT-MED" "SCOUT-MEDs" "\t\t\t\t" "\"[Scou]\" {"
				gen_detailed_pos_calls "1 SOLLY-MED" "SOLLY-MEDs" "\t\t\t\t" "\"[Solly]\" {"
				gen_detailed_pos_calls "1 PYRO-MED" "PYRO-MEDs" "\t\t\t\t" "\"[Pyr]\" {"
				printf "\t\t\t}\n"
				printf "\t\t\t\"[Dem/Heav/Eng]\" {\n"
				gen_detailed_pos_calls "1 DEMO-MED" "DEMO-MEDs" "\t\t\t\t" "\"[Dem]\" {"
				gen_detailed_pos_calls "1 HEAVY-MED" "HEAVY-MEDs" "\t\t\t\t" "\"[Heav]\" {"
				gen_detailed_pos_calls "1 ENGI-MED" "ENGI-MEDs" "\t\t\t\t" "\"[Eng]\" {"
				printf "\t\t\t}\n"
				printf "\t\t\t\"[Med/Snipe/Sp]\" {\n"
				gen_detailed_pos_calls "1 MED-MED" "MED-MEDs" "\t\t\t\t" "\"[Med]\" {"
				gen_detailed_pos_calls "1 SNIPER-MED" "SNIPER-MEDs" "\t\t\t\t" "\"[Snipe]\" {"
				gen_detailed_pos_calls "1 SPY-MED" "SPY-MEDs" "\t\t\t\t" "\"[Sp]\" {"
				printf "\t\t\t}\n"
				gen_detailed_pos_calls "1 MEDIC COMBO" "MEDIC COMBOS" "\t\t\t" "\"[Unknown]\" {"
			else
				printf "\t\t\"[%s]\" {\n" "${ClassNames[ClassID+SubID]^}"
				gen_detailed_pos_calls "1 ${ClassNames[ClassID+SubID]^^}" "${ClassNames[ClassID+SubID]^^}s" "\t\t\t"
			fi
			# Create "has weapon" calls ONLY if the class actually has special weapons defined.
			if [ $((ClassID+SubID)) -lt 9 ]
			then
				printf "\t\t\t\"[Weapons]\" {\n"
				# Primary Weapons
				printf "\t\t\t\t\"[Primary]\" {\n"
				for PrimaryWeaponGroup in ${Weapons[$(((ClassID+SubID)*3))]}
				do
					for Weapon in "${PrimaryWeaponGroup[@]}"
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${Weapon^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY %s USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${ClassNames[ClassID+SubID]^^}"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %sS USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${Amount}" "${ClassNames[ClassID+SubID]^^}"
						done
						printf "\t\t\t\t\t}\n"
					done
				done
				printf "\t\t\t\t}\n"
				# Secondary Weapons
				printf "\t\t\t\t\"[Secondary]\" {\n"
				for SecondWeaponGroup in ${Weapons[$((((ClassID+SubID)*3)+1))]}
				do
					for Weapon in "${SecondWeaponGroup[@]}"
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${Weapon^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY %s USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${ClassNames[ClassID+SubID]^^}"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %sS USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${Amount}" "${ClassNames[ClassID+SubID]^^}"
						done
						printf "\t\t\t\t\t}\n"
					done
				done
				printf "\t\t\t\t}\n"
				# Tertiary Weapons
				printf "\t\t\t\t\"[Tertiary]\" {\n"
				for TertiaryWeaponGroup in ${Weapons[$((((ClassID+SubID)*3)+2))]}
				do
					for Weapon in "${TertiaryWeaponGroup[@]}"
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${Weapon^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY %s USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${ClassNames[ClassID+SubID]^^}"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %sS USE $(printf "%s" "$Weapon" | tr "[:lower:]" "[:upper:]") (BIND)\" |\n" "${Amount}" "${ClassNames[ClassID+SubID]^^}"
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
					printf "\t\t\t\t\"[%s/%s/%s]\" {\n" "${ClassNames[DisguiseID]^}" "${ClassNames[DisguiseID+1]^}" "${ClassNames[DisguiseID+2]^}"
					for SubDID in 0 1 2
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${ClassNames[DisguiseID+SubDID]^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 SPY %s (BIND)\" |\n" "${ClassNames[DisguiseID+SubDID]^^}"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i SPY %sS (BIND)\" |\n" "${Amount}" "${ClassNames[DisguiseID+SubDID]^^}"
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
					printf "\t\t\t\"[%s]\" {\n" "${Build^}"
					if [ "$Build" = "sentry" ]
					then
						printf "\t\t\t\t\"[LvL1]\" {"
						gen_detailed_pos_calls "1 L1 SENTRY" "L1 SENTRIES" "\t\t\t\t\t"
						gen_detailed_pos_calls "DESTROYED 1 L1 SENTRY" "DESTROYED L1 SENTRIES" "\t\t\t\t\t" "\"[Destroyed]\" {"
						printf "\t\t\t\t}"
						printf "\t\t\t\t\"[LvL2]\" {"
						gen_detailed_pos_calls "1 L2 SENTRY" "L2 SENTRIES" "\t\t\t\t\t"
						gen_detailed_pos_calls "DESTROYED 1 L2 SENTRY" "DESTROYED L2 SENTRIES" "\t\t\t\t\t" "\"[Destroyed]\" {"
						printf "\t\t\t\t}"
						printf "\t\t\t\t\"[LvL3]\" {"
						gen_detailed_pos_calls "1 L3 SENTRY" "L3 SENTRIES" "\t\t\t\t\t"
						gen_detailed_pos_calls "DESTROYED 1 L3 SENTRY" "DESTROYED L3 SENTRIES" "\t\t\t\t\t" "\"[Destroyed]\" {"
						printf "\t\t\t\t}"
						printf "\t\t\t\t\"[Mini]\" {"
						gen_detailed_pos_calls "1 L0 SENTRY" "L0 SENTRIES" "\t\t\t\t\t"
						gen_detailed_pos_calls "DESTROYED 1 L0 SENTRY" "DESTROYED L0 SENTRIES" "\t\t\t\t\t" "\"[Destroyed]\" {"
						printf "\t\t\t\t}"
					else
						# Generate position calls for buildings.
						gen_detailed_pos_calls "1 $(printf "%s" "$Build" | tr "[:lower:]" "[:upper:]")" "$(printf "%s" "${Build}" | tr "[:lower:]" "[:upper:]")" "\t\t\t\t"
						# and for destroyed ones.
						gen_detailed_pos_calls "DESTROYED 1 $(printf "%s" "$Build" | tr "[:lower:]" "[:upper:]")" "DESTROYED $(printf "%s" "$Build" | tr "[:lower:]" "[:upper:]")s" "\t\t\t\t" "\"[Destroyed]\" {"
					fi
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
					printf "\t\t\t\t\"[%s]\" {\n" "${Meter}"
					printf "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY %s USED! (BIND)\" |\n" "$(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")"
					for Num in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY %sS USED! (BIND)\" |\n" "$(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")"
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
					printf "\t\t\t\t\"[%s]\" {\n" "${Banner}"
					printf "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>_\" \"say_team 1 ENEMY %s PREPPED (BIND)\" |\n" "$(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]")"
					for Num in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\tNOFORMAT BIND \"\" \"say_team $Num ENEMY %sS PREPPED (BIND)\" |\n" "$(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]")"
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
					for UberValue in 10 20 30
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER %s%% (BIND)\" |\n" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$UberValue"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %s ENEMY %s ÜBERS %s%% (BIND)\" |\n" "$Amount" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[40-60%%]\" {\n"
					for UberValue in 40 50 60
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER %s%% (BIND)\" |\n" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$UberValue"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s%% (BIND)\" |\n" $Amount "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[70-90%%]\" {\n"
					for UberValue in 70 80 90
					do
						printf "\t\t\t\t\t\t\t\"[%i%%]\" {\n" $UberValue
						printf "\t\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBER $UberValue%% (BIND)\" |\n"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s%% (BIND)\" |\n" $Amount "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$UberValue"
						done
						printf "\t\t\t\t\t\t\t}\n"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t\t\"[100%%]\" {\n"
					printf "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER 100%% (BIND)\" |\n" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")"
					for Amount in 2 3 4 5 6 7 8 9 0
					do
						printf "\t\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS 100%% (BIND)\" |\n" "$Amount" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")"
					done
					printf "\t\t\t\t\t\t}\n"
					printf "\t\t\t\t\t}\n"
					for Verb in 'popped' 'dropped' 'faked'
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "${Verb^}"
						printf "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174>Amount: _\" \"say_team 1 ENEMY %s ÜBER %s (BIND)\" |\n" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$(printf "%s" "$Verb" | tr "[:lower:]" "[:upper:]")"
						for Amount in 2 3 4 5 6 7 8 9 0
						do
							printf "\t\t\t\t\t\tNOFORMAT BIND \"\" \"say_team %i ENEMY %s ÜBERS %s (BIND)\" |\n" "${Amount}" "$(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]")" "$(printf "%s" "$Verb" | tr "[:lower:]" "[:upper:]")"
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
