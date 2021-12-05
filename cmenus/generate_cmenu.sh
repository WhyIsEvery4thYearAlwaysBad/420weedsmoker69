#!/bin/sh
# POSIX compliance baby!
BINDIR=$(dirname "$(readlink -fn "$0")")
cd "${BINDIR}" || exit 2
# Combine the three cmenus into one large cmenu.
echo '// This file is auto generated. To make edits please modify the cmenu files located in the cmenus directory.' > ../420cmdmenu.cmenu
cat ./420base.cmenu >> ../420cmdmenu.cmenu
./generate_call_cmenu.sh >> ../420cmdmenu.cmenu
cat ./navmesheditor.cmenu >> ../420cmdmenu.cmenu
# Set the bind counts for the bind at line 512 in 420base.cmenu.
BIND_COUNT=$(grep -c -i "\(//\\|/*\)\\{0\\}\(.\\+\)BIND\([[:space:]]*\)\"\(.*\)\"[[:space:]]*\"\([^\"]\{1,\}\)" ../420cmdmenu.cmenu)
CHAT_BIND_COUNT=$(grep -c -i "\(//\\|/*\)\\{0\\}\(.\\+\)BIND\([[:space:]]*\)\"\(.*\)\"[[:space:]]*\"say\(_team\)\?[[:space:]]\([^\"]\{1,\}\)" ../420cmdmenu.cmenu)
# Amount of binds that have been commented out.
COMMENTED_BIND_COUNT=9
sed -i "s/{_BIND_COUNT_}/${BIND_COUNT}/" ../420cmdmenu.cmenu # Add one more to account for the class-specific "CMenu" bind.
sed -i "s/{_CHAT_BIND_COUNT_}/${CHAT_BIND_COUNT}/" ../420cmdmenu.cmenu
