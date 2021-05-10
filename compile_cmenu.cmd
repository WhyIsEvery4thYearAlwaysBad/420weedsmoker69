@echo off
pushd "C:/Users/Owner/Documents/Projects/420weedsmoker69"
"C:/Users/Owner/Documents/Projects/CmdMenuGenerator/cmg-x64.exe" 420cmdmenu.cmenu --output-dir "C:/Program Files (x86)/Steam/steamapps/common/Team Fortress 2/tf/custom/420cmdmenu"
pushd "C:/Program Files (x86)/Steam/steamapps/common/Team Fortress 2/tf/custom/420cmdmenu/resource"
move /Y "closecaption_commandmenu.txt" "../../extras/resource"
cd ../../extras
captioncompiler -game "C:/Program Files (x86)/Steam/steamapps/common/Team Fortress 2/tf" "closecaption_commandmenu.txt"
move /Y "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\resource\closecaption_commandmenu.dat" "./resource"
cd ..
del 420cmdmenu.vpk
vpk 420cmdmenu
rd /S /Q 420cmdmenu
popd
popd
pause
