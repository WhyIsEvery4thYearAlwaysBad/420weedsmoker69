#!/bin/sh
TF2_DIR="/home/amicdict/.local/share/Steam/steamapps/common/Team Fortress 2" # File location of the Team Fortress 2 directory.
TF2_WIN_DIR="/home/amicdict/.local/share/Steam/steamapps/common/Team Fortress 2 (Windows)" # File location of the Team Fortress 2 directory.
CMG="../CmdMenuGenerator/cmg-x64" # File location of the cmenu generator exe.
# Exec in script dir
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# The actual script

sh ./cmenus/generate_cmenu.sh ./cmenu
$CMG 420cmdmenu.cmenu --output-dir "${TF2_DIR}/tf/custom/420cmdmenu"
if [ ! $? -eq 0 ]
then
    exit $?
fi
## Captions don't work in VPKs :(
cd "${TF2_DIR}/tf/custom/420cmdmenu"
mv -f "./resource/closecaption_commandmenu.txt" "${TF2_WIN_DIR}/tf/resource/"
mkdir -p ../extras/resource
cd "$TF2_WIN_DIR"
wine ./bin/captioncompiler.exe -game tf closecaption_commandmenu.txt
cd "$TF2_DIR/tf/custom"
mv -f "${TF2_WIN_DIR}/tf/resource/closecaption_commandmenu.dat" "./extras/resource/"
mv -f "${TF2_WIN_DIR}/tf/resource/closecaption_commandmenu.txt" "./extras/resource/"
rm -f 420cmdmenu.vpk
vpk 420cmdmenu
rm -rf 420cmdmenu
