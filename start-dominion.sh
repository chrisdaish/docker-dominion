#!/bin/bash
groupmod -g $gid dominion
usermod -u $uid -g $gid dominion

exec su -ls "/bin/bash" -c "/opt/Dominion/Dominion.x86_64" dominion
