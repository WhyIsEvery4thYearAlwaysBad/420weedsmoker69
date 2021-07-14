#!/bin/sh
# POSIX compliance baby!
# Combine the three cmenus into one large cmenu.
cat ./420base.cmenu > ../420cmdmenu.cmenu
./generate_call_cmenu.sh >> ../420cmdmenu.cmenu
cat ./navmesheditor.cmenu >> ../420cmdmenu.cmenu
# Set the bind counts for the bind at line 512 in 420base.cmenu.
BIND_COUNT=$(grep -c -i "BIND\([[:space:]]*\)\"\(.*\)\"[[:space:]]*\"\(.\{1,\}\)\"" ../420cmdmenu.cmenu)
CHAT_BIND_COUNT=$(grep -c -i "BIND\([[:space:]]*\)\"\(.*\)\"[[:space:]]*\"say\(_team\)\?[[:space:]]\(.\{1,\}\)\"" ../420cmdmenu.cmenu)
sed -i "s/{_BIND_COUNT_}/${BIND_COUNT}/" ../420cmdmenu.cmenu
sed -i "s/{_CHAT_BIND_COUNT_}/${CHAT_BIND_COUNT}/" ../420cmdmenu.cmenu
