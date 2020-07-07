#!/bin/bash
# (from https://www.howtogeek.com/451262/how-to-use-rclone-to-back-up-to-google-drive-on-linux/)

#backup DATA 
rclone copy --bwlimit=2M --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/media/simoes/DATA" "mega:DATA_backup"

#backup home 
rclone copy --bwlimit=2M --update --verbose --transfers 30 --checkers 8 --contimeout 60s --timeout 300s --retries 3 --low-level-retries 10 --stats 1s "/home" "mega:home_backup"

