#!/usr/bin/expect -f

#spawn "cd /home/strela/sites/torgash; git add . ; git commit -m 'test'; git push"
spawn /home/strela/sites/test2.sh
#spawn ""

expect "Username for 'https://github.com':"
send "vitaliikravchenko\n"
expect "Password for 'https://github.com':"
send "v9311280\n"

