@echo off
set DAY=%date:~4,2%
set MONTH=%date:~7,2%
set YEAR=%date:~10,4%
set HOUR=%time:~0,2%
set MIN=%time:~3,2%
set SEC=%time:~6,2%
"C:\Program Files\7-Zip\7z" a -o{"C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\custom\420weedsmoker69"} -- "tf2_cfg_backup_%DAY%_%MONTH%_%YEAR%_%HOUR%_%MIN%_%SEC%" "%HOMECONFIG%"