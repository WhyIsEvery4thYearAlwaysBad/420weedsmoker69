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
# $5 - Max Count

# TODO: Make it use Quinary.
generate_cmenu_count() {
    printf '%b"%s" {\n' "$3" "${4:-[Amount]}"
    # Quinary System
    Amount=0
    for Key in '`' `seq 1 4`
    do
	printf '%b\tKEY="%s" NOFORMAT "" {\n' "$3" "$Key"
	for Key2 in '`' `seq 1 4`
	    do
		printf '%b\t\tKEY="%s" NOFORMAT "%s" {\n' "$3" "${Key2}" "$([ "$Key2" = '`' ] && printf '%s_' "${Key1}")"
		for Key3 in '`' `seq 1 4`
		do
		    printf '%b\t\t\tKEY="%s" NOFORMAT BIND "%s" "say_team %i %s (BIND)" |\n' "$3" "${Key3}" "$([ "$Key2" = '`' ] && printf '%s_' "${Key1}${Key2}")" "$Amount" "$( ([ "$Amount" = '1' ] && printf '%s' "$1") || printf '%s' "$2")"
		    Amount=$((Amount+1))
		done
		printf '%b\t\t}\n' "$3"
	done
	printf '%b\t}\n' "$3"
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
			./gen_pos_calls.sh "$1 @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "\"[${Point%" Spawn "}]\" {"
		elif [ "$Point" = "RED Spawn" ]
		then
			./gen_pos_calls.sh "$1 @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "\"[${Point%" Spawn "}]\" {"
			printf "%b\t}\n" "${TAB_STR}"
			printf "%b\t\"[Point]\" {\n" "${TAB_STR}"
		else 
			./gen_pos_calls.sh "$1 @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${2} @ $(printf "%s" "$Point" | tr "[:lower:]" "[:upper:]")" "${TAB_STR}\t\t" "NOFORMAT \" \" {"
		fi
	done
	# Generic Position
	printf "%b\t}\n" "${TAB_STR}"
	./gen_pos_calls.sh "$1" "$2" "${TAB_STR}\t"
	# Cart
	generate_cmenu_count "$1 @ CART!" "$2 @ CART!" "${TAB_STR}\t" 'Cart'
	printf "%b}\n" "${TAB_STR}"
}

# The main function body.
main() {
	printf '"%s" {\n' "$TITLE"
	# Get all classes
	for ClassGroup in 'Scout Soly Pyro' 'Demo Heavy Engi' 'Medic Snipr Spy' 'Med-Combo Trap Builds'
	do
		# Name the building array "Builds" instead of 'sentry dispenser…'.
		printf '\t"[%s]" {\n' "$(printf "$ClassGroup" | tr '[:space:]' '/')"
		# The actual calls
		for Class in $ClassGroup
		do
		    # Generate position calls for all classes, except buildings.
		    printf "\t\t\"[%s]\" {\n" "$Class"
		    [ "$Class" != 'Med-Combo' ] && [ "$Class" != 'Builds' ] && gen_detailed_pos_calls "1 $(printf '%s' "${Class%%s}" | tr '[:lower:]' '[:upper:]')" "$(printf '%s' "${Class%%s}" | tr '[:lower:]' '[:upper:]')s" "\t\t\t"
		 	# Create "has weapon" calls ONLY if the class actually has special weapons defined.
		 	if [ "$(dasel select -f "$weapon_config" --null -s ".$Class")" != "null" ]
		 	then
		 	    	printf "\t\t\t\"[Weapons]\" {\n"
		 		for WeaponSlot in $(dasel select -f "$weapon_config" -n -m -s ".$Class.-")
		 		do
		 			printf '\t\t\t\t"[%s]" {\n' "$WeaponSlot"
		 			for CategoryIndex in $(dasel select -f "$weapon_config" -n -m -s ."$Class"."$WeaponSlot".- | tr -d '"')
		 			do
					    if [ -z "$(dasel select -f "$weapon_config" -n -s ."$Class"."$WeaponSlot".["$CategoryIndex"] | grep weapons)" ]
					    then
						Weapon="$(dasel select -f "$weapon_config" -s ."$Class"."$WeaponSlot".["$CategoryIndex"] | sed 's/- //' | tr -d '"')"
					      	generate_cmenu_count "1 ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]') USE $(printf '%b' "$Weapon" | tr '[:lower:]' '[:upper:]')!" "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S USE $(printf '%b' "$Weapon" | tr '[:lower:]' '[:upper:]')!" '\t\t\t\t\t' "[${Weapon}]"
					    else
					    	printf '\t\t\t\t\t"[%s]" {\n' "$(dasel select -f "$weapon_config" -n -s ."$Class"."$WeaponSlot".["$CategoryIndex"].category)"
		 				for Weapon in $(dasel select -f "$weapon_config" -n -m -s ."$Class"."$WeaponSlot".["$CategoryIndex"].weapons | sed 's/- //' | tr -d '"')
		 				do
		 				    generate_cmenu_count "1 ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]') USE $(printf '%b' "$Weapon" | tr '[:lower:]' '[:upper:]')!" "ENEMY $(printf '%b' "$Class" | tr '[:lower:]' '[:upper:]')S USE $(printf '%s' "$Weapon" | tr '[:lower:]' '[:upper:]')!" '\t\t\t\t\t\t' "[$(printf '%b' "${Weapon}")]"
		 				done
		 				printf '\t\t\t\t\t}\n'
					    fi
		 			done
					printf '\t\t\t\t}\n'
		 		done
		 		printf '\t\t\t}\n'
		 	fi
			# Print out position calls for medic-X comboes.
			if [ "$Class" = "Med-Combo" ]
		 	then
		 		printf '\t\t\t"[Scou/Solly/Pyr]" {\n'
		 		gen_detailed_pos_calls "1 SCOUT-MED" "SCOUT-MEDs" "\t\t\t\t" "\"[Scou]\" {"
		 		gen_detailed_pos_calls "1 SOLY-MED" "SOLY-MEDs" "\t\t\t\t" "\"[Solly]\" {"
		 		gen_detailed_pos_calls "1 PYRO-MED" "PYRO-MEDs" "\t\t\t\t" "\"[Pyr]\" {"
		 		printf '\t\t\t}\n'
		 		printf '\t\t\t"[Dem/Heav/Eng]" {\n'
		 		gen_detailed_pos_calls "1 DEMO-MED" "DEMO-MEDs" "\t\t\t\t" "\"[Dem]\" {"
		 		gen_detailed_pos_calls "1 HEAVY-MED" "HEAVY-MEDs" "\t\t\t\t" "\"[Heav]\" {"
		 		gen_detailed_pos_calls "1 ENGI-MED" "ENGI-MEDs" "\t\t\t\t" "\"[Eng]\" {"
		 		printf '\t\t\t}\n'
		 		printf '\t\t\t"[Med/Snipe/Sp]" {\n'
		 		gen_detailed_pos_calls "1 MED-MED" "MED-MEDs" "\t\t\t\t" "\"[Med]\" {"
		 		gen_detailed_pos_calls "1 SNIPR-MED" "SNIPR-MEDs" "\t\t\t\t" "\"[Snipe]\" {"
		 		gen_detailed_pos_calls "1 SPY-MED" "SPY-MEDs" "\t\t\t\t" "\"[Sp]\" {"
		 		printf '\t\t\t}\n'
		 		gen_detailed_pos_calls "1 MED-COMBO" "MED-COMBOS" "\t\t\t" "\"[Unknown]\" {"
		 	fi
		 	# Start Spy Disguises.
		 	if [ "$Class" = "Spy" ]
		 	then
		 		printf "\t\t\t\"[Disgis]\" {\n"
		 		for DisguiseGroup in 'Scout Soly Pyro' 'Demo Heavy Engi' 'Medic Snipr Spy'
		 		do
		 			printf '\t\t\t\t"[%s]" {\n' "`printf '%s' "$DisguiseGroup" | tr '[:space:]' '/'`"
		 			for DisguiseClass in $DisguiseGroup
		 			do
		 				generate_cmenu_count "SPY ${DisguiseClass}!" "SPY ${DisguiseClass}s!" '\t\t\t\t\t' "$DisguiseClass"
		 			done
		 			printf '\t\t\t\t}\n'
		 		done
		 		generate_cmenu_count 'SPY DED RANG!' 'SPIES DED RANG!' '\t\t\t\t' '[Dead Rang]'
		 		printf '\t\t\t\tBIND "Spy!" "say_team SPY - CHEK BAKS! (BIND)" |\n'
		 		printf '\t\t\t}\n'
		 	fi
		 	# ^ End Spy Disguises
		 	# <Builds>
		 	if [ "$Class" = 'Builds' ]
		 	then
		 		for Build in "Sntry" "Dispenser" "Tele Ent." "Tele Exit" "Nest"
		 		do
		 		    printf '\t\t\t"[%s]" {\n' "${Build}"
				    # Generate position calls for buildings.
		 		    # and for destroyed ones.
		 		    for Level in 'General' $([ "$Build" = "Sntry" ] && printf 'Mini') 'LvL1' 'LvL2' 'LvL3'
				    do
					printf '\t\t\t\t"[%s]" {\n' "$Level"
					[ "$Level" = 'General' ] && Level=""
					BuildNameCapitalized="$(printf '%s' "$Build" | tr '[:lower:]' '[:upper:]')"
		 			gen_detailed_pos_calls "1 ENEMY $Level $BuildNameCapitalized" "ENEMY $Level ${BuildNameCapitalized}S" "\t\t\t\t\t"
		 			generate_cmenu_count "1 ENEMY $Level ${BuildNameCapitalized} DOWN!" "ENEMY $Level ${BuildNameCapitalized}S DOWN!" '\t\t\t\t\t' "Dead"
					generate_cmenu_count "1 ENEMY $Level ${BuildNameCapitalized} SAPPED!" "ENEMY $Level ${BuildNameCapitalized}S SAPPED!" '\t\t\t\t\t' "Sapped"
		 			printf '\t\t\t\t}\n'
				    done
		 		    printf "\t\t\t}\n"
		 		done
		 	fi
		 	# </Builds>
			# <Phlog/GP calls>
			if [ "$Class" = 'Pyro' ]
			then
				printf '\t\t\t"[Meters]" {\n'
				for Meter in "Phlog" "Gas Passer"
				do
				    generate_cmenu_count "ENEMY PYRO ACTIVATED $(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")!" "ENEMY PYROS ACTIVATED $(printf "%s" "$Meter" | tr "[:lower:]" "[:upper:]")!" '\t\t\t\t' "$Meter"
			     	done
				printf "\t\t\t}\n"
			fi
			# </Phlog/GP calls>
			# <Banner Calls>
			if [ "$Class" = 'Soly' ]
			then
				printf '\t\t\t"[Banners]" {\n'
				for Banner in "Buf Banr" "Batal" "Conch"
				do
				    generate_cmenu_count "1 ENEMY $(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]") USED!" "ENEMY $(printf "%s" "$Banner" | tr "[:lower:]" "[:upper:]")S USED!" "\t\t\t\t" "$Banner"
				done
				printf "\t\t\t}\n"
			fi
			# </Banner Calls>
			# <Über calls>
			if [ "$Class" = "Medic" ]
			then
				printf '\t\t\t"[Über]" {\n'
				for UberType in "stok" "kritz" "quiki" "vacc" "unown"
				do
				    printf '\t\t\t\t"[%s]" {\n' "$(printf '%s' "${UberType}")"
				    # Uber values.
				    printf '\t\t\t\t\t"[Values]" {\n'
				    Temp_Amount=0
				    for Key in '`' `seq 1 4`
				    do
					printf '\t\t\t\t\t\tKEY="%s" NOFORMAT "" {\n' "$Key1"
					for Key2 in '`' `seq 1 4`
					do
					    printf '\t\t\t\t\t\t\tKEY="%s" NOFORMAT "%s" {\n' "$3" "${Key2}" "$([ "$Key2" = '`' ] && printf '%s_' "${Key1}")"
					    for Key3 in '`' `seq 1 4`
					    do
						generate_cmenu_count "1 ENEMY $(printf '%s' "$UberType" | tr '[:lower:]' '[:upper:]') ÜBER @ ${TempAmount}%!" "ENEMY $(printf '%s' "$UberType" | tr '[:lower:]' '[:upper:]') ÜBERS @ ${Temp_Amount}%!" '\t\t\t\t\t\t\t\t' "[Uber Value]"
						Temp_Amount=$((Temp_Amount+1))
					    done
					    printf '\t\t\t\t\t\t\t}\n'
					done
					printf '\t\t\t\t\t\t}\n'
				    done
				    printf '\t\t\t\t\t}\n'
				    
				    for Verb in 'popd' 'dropd' 'fakd'
				    do
					generate_cmenu_count "1 ENEMY $(printf '%s' "$UberType" | tr '[:lower:]' '[:upper:]') ÜBER $(printf '%s' "$Verb" | tr '[:lower:]' '[:upper:]')" "ENEMY $(printf "%s" "$UberType" | tr "[:lower:]" "[:upper:]") ÜBERS $(printf "%s" "$Verb" | tr "[:lower:]" "[:upper:]")" '\t\t\t\t\t' "$Verb"
				    done
				    printf "\t\t\t\t}\n"
				done
				printf "\t\t\t}\n"
			fi
			# </Über>
			# Generate calls for Giant (robots).
			generate_cmenu_count "1 ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]') DOWN!" "ENEMY $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S DOWN!" '\t\t' 'Dead'
			generate_cmenu_count "ENEMY TEAM HAS 1 $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')!" " $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S ON ENEMY TEAM!" '\t\t' 'Amount'
			test "$Class" != 'Trap' && test "$Class" != 'Builds' && gen_detailed_pos_calls "1 GIANT $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')" "GIANT $(printf '%s' "$Class" | tr '[:lower:]' '[:upper:]')S" '\t\t' '"[Giant]" {'
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
