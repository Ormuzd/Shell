#!/usr/bin/expect -f

spawn ssh root@***.***.***.***
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
