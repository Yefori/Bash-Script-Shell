#!/bin/bash

wget https://raw.githubusercontent.com/Yefori/Shell-Scripts/master/Lser/scanner.py -O scanner.py
python scanner.py 43.225.100.0/24 -t 50 -T 5 -p 22 > list

echo -e '' > result
function  for_in_file(){
for  i  in  `cat list`
do
echo -e '\n\n' >> result
/usr/local/bin/expect <<-EOF
set timeout 2
spawn ssh root@$i
expect {
"*yes/no" { send "yes\r"; exp_continue }
"*password:" { send "default4321\r" }
}
send "free\r">>result
expect eof
EOF

done
}
