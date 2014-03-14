#!/usr/bin/expect -f

spawn ssh root@219.217.191.100
expect "*assword:*"
send "parabloa\r"
expect "root*" 
send "cd /backup/\r"
expect "root*"
send "sh main.sh\r"
expect "root*"
send "cd /root\r"
expect "root*"
send "./move.sh\r"
