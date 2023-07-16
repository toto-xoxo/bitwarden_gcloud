#!/usr/bin/env sh

# Local timezone - use the TZ database name from https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
TZ=Europe/Paris

# Local time to schedule reboot
TIME=05:00

SCHEDULED=$(eval "date -d 'TZ=\"$TZ\" $TIME' +%H:%M")

sudo update_engine_client --block_until_reboot_is_needed
sudo shutdown -r $SCHEDULED
