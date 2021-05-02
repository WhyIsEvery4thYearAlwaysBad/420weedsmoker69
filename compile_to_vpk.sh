# This BASH script automatically compiles the config into a VPK.
cd ~/Documents/Projects/420weedsmoker69
vpk a 420weedsmoker69.vpk @responsefile.txt
# Halt execution if VPK compiler gets an error…
if [ ! $? -eq 0 ]
then
	read -n1 -p "Errors have occurred! Press enter to continue."
fi
# otherwise continue with regular operations.
cp 420weedsmoker69.vpk "C:/Program Files (x86)/Steam/steamapps/common/Team Fortress 2/tf/custom"
rm -f 420weedsmoker69.vpk