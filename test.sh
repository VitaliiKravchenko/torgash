#!/usr/bin/expect -f

spawn /home/strela/sites/torgash/test2.sh [lindex $argv 0]; 

expect "Username for 'https://github.com':"
send "vitaliikravchenko\n"
expect "Password for 'https://vitaliikravchenko@github.com':"
send -- "v9311280\r"
expect eof

