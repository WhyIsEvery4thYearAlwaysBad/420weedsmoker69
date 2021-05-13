#!/bin/bash
# Config
title="[Calls]"
ClassNames=("scout" "solly" "pyro" "demo" "heavy" "engi" "medic" "sniper" "spy" "medic Combo" "trap" "nest")
Weapons=( 'Bonk! CaC Mad\040Milk' 'Buff\040Banner Battals Conch Gunboats'  'Phlog Gas\040Passer' '' '' '' 'Stock Medigun Kritz Quickie Vacc Solemn\040Vow' '' 'YER')

# Directions
Directions=("left" "mid" "right" "up" "down" "back")

# end Config
echo -e "\"$title\" {" > callcmenu_script_result.txt
# Get all classes
for ClassID in {0..10..3}
do
	echo -e "\t\"[${ClassNames[ClassID]^}/${ClassNames[ClassID+1]^}/${ClassNames[ClassID+2]^}]\" {" >> callcmenu_script_result.txt

	# The actual calls
	for SubID in {0..2}
	do
		# Dont let the classid go beyond the allowed limit
		echo -e "\t\t\"[${ClassNames[ClassID+SubID]^}]\" {" >> callcmenu_script_result.txt
		# Position calls
		echo -e "\t\t\t\"[Pos]\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"<clr:234,209,174><B>        [4]      <cr>\" {" >> callcmenu_script_result.txt
		
		# Actually create the position calls
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ] 
			then echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${ClassNames[ClassID+SubID]^^} MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S MID (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
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
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
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
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK LEFT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \"[1]    [2]    [3]<cr>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK MID LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK RIGHT LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"<clr:234,209,174><B>[1]    [4]    [3]<cr> <cr>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK UPPER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"        [5]     <B>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK UPPER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK UPPER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
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
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK LOWER LEFT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \" <cr>\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK LOWER RIGHT (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOEXIT NOFORMAT BIND \"\" \"\" |" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t\tNOFORMAT \"[1]    [5]    [3]<B>\" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK LOWER (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t\tNOFORMAT \" \" {" >> callcmenu_script_result.txt
		for Amount in {1..9} 0
		do
			if [ $Amount -eq 1 ]
			then
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \"<clr:234,209,174><B>_<B>\" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^} BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			else
				echo -e "\t\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ${ClassNames[ClassID+SubID]^^}S BACK (TEAM SIDE) (BIND)\" |" >> callcmenu_script_result.txt
			fi
		done
		echo -e "\t\t\t\t\t}" >> callcmenu_script_result.txt
		echo -e "\t\t\t\t}" >> callcmenu_script_result.txt
		# End position calls
		echo -e "\t\t\t}" >> callcmenu_script_result.txt
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
								echo -e "\t\t\t\t\tNOFORMAT BIND \"How many?\" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^} HAVE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
							else
								echo -e "\t\t\t\t\tNOFORMAT BIND \" \" \"say_team ${Amount} ENEMY ${ClassNames[ClassID+SubID]^^}S HAVE ${Weapon^^} (BIND)\" |"  >> callcmenu_script_result.txt
							fi
					done
					echo -e "\t\t\t\t}"  >> callcmenu_script_result.txt
				done
			done
			# End Weapon calls
			echo -e "\t\t\t}" >> callcmenu_script_result.txt
		fi
		# End class cmenu
		echo -e "\t\t}" >> callcmenu_script_result.txt
	done
	# End braces
	echo -e "\t}" >> callcmenu_script_result.txt
done

# Ending braces.
echo -e "}" >> callcmenu_script_result.txt