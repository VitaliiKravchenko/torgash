#!/usr/bin/expect -f

#spawn "cd /home/strela/sites/torgash; git add . ; git commit -m 'test'; git push"
spawn /home/strela/sites/test2.sh
#spawn ""

expect \"Username\"
send \"vitaliikravchenko\"
expect \"Password\"
send \"v9311280\"

