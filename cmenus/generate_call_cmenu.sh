#!/bin/sh
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# This scripts generates the [Calls] cmenu through output.

# Metaconfiguration for YAML.
YAML_PARSER=dasel
weapon_config=weapon_list.yaml
# CMenu configuration.
TITLE="[Calls]"

# end Config

# Function to generate position calls with generic locations.
# $1 - The name of the thing to make pos calls for. (Singular)
# $2 - The name of the thing to make pos calls for. (Plural)
# $3 - Tab count
# $4 - CMenu Name.
generate_cmenu_count() {
    printf '%b"%s" {\n' "$3" "${4:-[Amount]}"
    printf '%b\tNOFORMAT BIND "<clr:234,209,174>Amount: _" "say_team %s (BIND)" |\n' "$3" "$1"
    for Amount in `seq 2 9` 0
    do
	printf '%b\tNOFORMAT BIND "" "say_team %i %s (BIND)" |\n' "$3" "$Amount" "$2"
    done
    printf '%b}\n' "$3"
}

# Function to generate position calls with generic locations.
# $1 - The name of the thing to make pos calls for. (Singular)
# $2 - The name of the thing to make pos calls for. (Plural)
# $3 - Tab count
# $4 - The entire CMenu definition line. Default val: Pos.
gen_detailed_pos_calls() {
	TAB_STR="$3"
	printf "%b%s\n" "${TAB_STR}" "${4:-"\"[Pos]\" {"}"
	for Point in "BLU Spawn" "RED Spawn" "1st" "2nd" "3rd" "4th" "5th" "6th" "7th" "8th" "9th" "LAST"
	do
		if [ "$Point" = "BLU Spawn" ]
		then
			printf "%b\t\"[Spawn]\" {\n" "${TAB_STR}"
			./gen_pos_calls.sh "$1 $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "\"[${Point%" Spawn "}]\" {"
		elif [ "$Point" = "RED Spawn" ]
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
	printf '"%s" {\n' "$TITLE"
	# Get all classes
	for ClassGroup in 'scout soldier pyro' 'demo heavy engi' 'medic sniper spy' 'med-combo trap builds'
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
		printf '\t"[%s]" {\n' "$(printf "$ClassGroup" | tr '[:space:]' '/')"

		# The actual calls
		for Class in $ClassGroup
		do
		    # Dont let the classid go beyond the allowed limit
		    # Generate position calls for all classes. Not buildings yet tho.
		      	if [ "$Class" = "med-combo" ]
		 	then
		 		printf '\t\t"[Medic Combo]" {\n'
		 		printf '\t\t\t"[Scou/Solly/Pyr]" {\n'
		 		gen_detailed_pos_calls "1 SCOUT-MED" "SCOUT-MEDs" "\t\t\t\t" "\"[Scou]\" {"
		 		gen_detailed_pos_calls "1 SOLLY-MED" "SOLLY-MEDs" "\t\t\t\t" "\"[Solly]\" {"
		 		gen_detailed_pos_calls "1 PYRO-MED" "PYRO-MEDs" "\t\t\t\t" "\"[Pyr]\" {"
		 		printf '\t\t\t}\n'
		 		printf '\t\t\t"[Dem/Heav/Eng]" {\n'
		 		gen_detailed_pos_calls "1 DEMO-MED" "DEMO-MEDs" "\t\t\t\t" "\"[Dem]\" {"
		 		gen_detailed_pos_calls "1 HEAVY-MED" "HEAVY-MEDs" "\t\t\t\t" "\"[Heav]\" {"
		 		gen_detailed_pos_calls "1 ENGI-MED" "ENGI-MEDs" "\t\t\t\t" "\"[Eng]\" {"
		 		printf "\t\t\t}\n"
		 		printf '\t\t\t"[Med/Snipe/Sp]" {\n'
		 		gen_detailed_pos_calls "1 MED-MED" "MED-MEDs" "\t\t\t\t" "\"[Med]\" {"
		 		gen_detailed_pos_calls "1 SNIPER-MED" "SNIPER-MEDs" "\t\t\t\t" "\"[Snipe]\" {"
		 		gen_detailed_pos_calls "1 SPY-MED" "SPY-MEDs" "\t\t\t\t" "\"[Sp]\" {"
		 		printf "\t\t\t}\n"
		 		gen_detailed_pos_calls "1 MEDIC COMBO" "MEDIC COMBOS" "\t\t\t" "\"[Unknown]\" {"
		 	else
		 		printf "\t\t\"[%s]\" {\n" "$(printf '%s' "$Class")"
		 		gen_detailed_pos_calls "1 $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')" "$(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')s" "\t\t\t"
		 	fi
		 	# Create "has weapon" calls ONLY if the class actually has special weapons defined.
		 	if [ "$(dasel select -f "$weapon_config" --null -s ".$Class")" != "null" ]
		 	then
		 	    	printf "\t\t\t\"[Weapons]\" {\n"
		 		for WeaponSlot in $(dasel select -f "$weapon_config" -n -m -s ".$Class.-")
		 		do
		 			printf '\t\t\t\t"[%s]" {\n' "$WeaponSlot"
		 			for CategoryIndex in $(dasel select -f "$weapon_config" -n -m -s ."$Class"."$WeaponSlot".- | tr -d '"')
		 			do
					    if [ -z "$(dasel select -f "$weapon_config" -n -s ."$Class"."$WeaponSlot".["$CategoryIndex"] | grep "weapons")" ]
					    then
						Weapon="$(dasel select -f "$weapon_config" -s ."$Class"."$WeaponSlot".["$CategoryIndex"] | sed 's/- //'| tr -d '"')"
					      	generate_cmenu_count "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]') USE $(printf '%s' "$Weapon" | tr '[:lower:]' '[:upper:]')!" "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S USE $(printf '%s' "$Weapon" | tr '[:lower:]' '[:upper:]')!" '\t\t\t\t\t' "[${Weapon}]"
					    else
					    	printf '\t\t\t\t\t"[%s]" {\n' "$(dasel select -f "$weapon_config" -n -s ."$Class"."$WeaponSlot".["$CategoryIndex"].category)"
		 				for Weapon in $(dasel select -f "$weapon_config" -n -m -s ."$Class"."$WeaponSlot".["$CategoryIndex"].weapons | sed 's/- //' | sort)
		 				do
		 				    generate_cmenu_count "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]') USE $(printf '%s' "$Weapon" | tr '[:lower:]' '[:upper:]')!" "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S USE $(printf '%s' "$Weapon" | tr '[:lower:]' '[:upper:]')!" '\t\t\t\t\t\t' "[${Weapon}]"
		 				done
		 				printf '\t\t\t\t\t}\n'
					    fi
		 			done
					printf '\t\t\t\t}\n'
		 		done
		 		printf '\t\t\t}\n'
		 	fi
		 	# Start Spy Disguises.
		 	if [ "$Class" = "spy" ]
		 	then
		 		printf "\t\t\t\"[Disguise]\" {\n"
		 		for DisguiseGroup in 'scout soldier pyro' 'demo heavy engi' 'medic sniper spy'
		 		do
		 			printf '\t\t\t\t"[%s]" {\n' "`printf '%s' "$DisguiseGroup" | tr '[:space:]' '/'`"
		 			for DisguiseClass in $DisguiseGroup
		 			do
		 				generate_cmenu_count "SPY ${DisguiseClass}! (BIND)" "SPY ${DisguiseClass}s! (BIND)" '\t\t\t\t\t' "$Disguise"
		 			done
		 			printf "\t\t\t\t}\n"
		 		done
		 		printf "\t\t\t\tBIND \"Dead Rang!\" \"say_team SPY DEAD RANG (BIND)\" |\n"
		 		printf "\t\t\t\tBIND \"Spy!\" \"say_team SPY - CHECK BACKS! (BIND)\" |\n"
		 		printf "\t\t\t}\n"
		 	fi
		 	# ^ End Spy Disguises
		 	# <Builds>
		 	if [ "$ClassGroup" = 'builds' ]
		 	then
		 		for Build in "Sentry" "Dispenser" "Tele entrance" "Tele exit" "Nest"
		 		do
		 			printf '\t\t\t"[%s]" {\n' "${Build}"
		 			if [ "$Build" = "Sentry" ]
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
			if [ "$Class" = 'pyro' ]
			then
				printf '\t\t\t"[Meters]" {\n'
				for Meter in "Phlog" "Gas Passer"
				do
				    generate_cmenu_count "ENEMY PYRO USED $(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")!" "ENEMY PYROS USED $(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")!" '\t\t\t\t' "$Meter"
			     	done
				printf "\t\t\t}\n"
			fi
			# </Phlog/GP calls>
			# <Banner Calls>
			if [ "$Class" = 'soldier' ]
			then
				printf '\t\t\t"[Banners]" {\n'
				for Banner in "Buff Banner" "Battal" "Conch"
				do
				    generate_cmenu_count "1 ENEMY $(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]") USED!" "ENEMY $(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]")S USED!" "\t\t\t\t" "$Banner"
				done
				printf "\t\t\t}\n"
			fi
			# </Banner Calls>
			# <Über calls>
			if [ "$Class" = "medic" ]
			then
				printf '\t\t\t"[Über]" {\n'
				for UberType in "stock" "kritz" "quickie" "vacc" "unknown"
				do
					printf '\t\t\t\t"[%s]" {\n' "$(printf '%s' "${UberType}")"
					printf '\t\t\t\t\t"[Value]" {\n'
					
					for UberValueGroup in "10 20 30" "40 50 60" "70 80 90"
					do
					    printf '\t\t\t\t\t\t"[%s]" {\n' "$(printf '%s' "$UberValueGroup" | tr '[:space:]' '/')"
					    for UberValue in $UberValueGroup
					    do
						generate_cmenu_count "1 ENEMY $UberType ÜBER @ ${UberValue}%!" "ENEMY $UberType ÜBERS @ ${UberValue}%!" '\t\t\t\t\t\t\t' "$UberValue"'%'
					    done
					    printf '\t\t\t\t\t\t}\n'
					done
					generate_cmenu_count "ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBER @ 100%!" "ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBERS @ 100%!" '\t\t\t\t\t\t' "100%"
				      	printf "\t\t\t\t\t}\n"
					for Verb in 'active' 'dropped' 'faked'
					do
						printf "\t\t\t\t\t\"[%s]\" {\n" "$(printf '%s' "$Verb")"
						generate_cmenu_count "ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBER $(printf "%s" "$Verb" | tr "[:lower:]" "[:upper:]")" "ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBERS $(printf "%s" "$Verb" | tr "[:lower:]" "[:upper:]")" '\t\t\t\t\t\t' "$UberType"
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
