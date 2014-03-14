#!/usr/bin/expect -f

set date [exec date "+%Y-%m-%d.%H:%M:%S"]
set timeout 10
spawn scp -r root@***.***.***.***:/backup$date.sql /backup/
set timeout 10
expect { "yes/no" {send "yes\r";exp_continue} }
expect "root@***.***.***.***'s password:"
set timeout 10
send "parabloa\r"
set timeout 200
send "exit\r"
expect eof
