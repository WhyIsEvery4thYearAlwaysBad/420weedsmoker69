#!/usr/bin/bash
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# This BASH script automatically compiles the config into a VPK.
vpk a 420weedsmoker69.vpk @responsefile.txt
# Halt execution if VPK compiler gets an error…
if [ ! $? -eq 0 ]
then
	read -n1 -p "Errors have occurred! Press enter to continue."
# otherwise continue with regular operations.
else
	mv -f 420weedsmoker69.vpk "/home/amicdict/.local/share/Steam/steamapps/common/Team Fortress 2/tf/custom"
fi
