TF2_DIR="/c/Program Files (x86)/Steam/steamapps/common/Team Fortress 2" # File location of the Team Fortress 2 directory.
CMG_EXE="/c/Users/Owner/Documents/Projects/CmdMenuGenerator/cmg-x64" # File location of the cmenu generator exe.
# The actual script
$CMG_EXE 420cmdmenu.cmenu --output-dir "${TF2_DIR}/tf/custom/420cmdmenu"
## Captions don't work in VPKs :(
pushd "${TF2_DIR}/tf/custom/420cmdmenu/resource"
mv -f "closecaption_commandmenu.txt" "../../extras/resource"
cd ../..
mkdir -p extras
cd extras
captioncompiler -game "${TF2_DIR}/tf" "closecaption_commandmenu.txt"
mv -f "${TF2_DIR}/tf/resource/closecaption_commandmenu.dat" "./resource"
cd ..
rm -f 420cmdmenu.vpk
vpk 420cmdmenu
rm -rf 420cmdmenu
popd