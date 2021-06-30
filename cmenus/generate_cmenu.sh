#!/bin/sh
cat ./420base.cmenu > ../420cmdmenu.cmenu
./generate_call_cmenu.sh >> ../420cmdmenu.cmenu
cat ./navmesheditor.cmenu >> ../420cmdmenu.cmenu
