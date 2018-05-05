#!/bin/bash
wget https://raw.githubusercontent.com/Yefori/Shell-Scripts/master/Lser/scanner.py -O scanner.py
python scanner.py 43.225.100.0/24 -t 50 -T 5 -p 22 > list

echo -e '' > result


for  i  in  `cat list`
do
echo -e $i':\n' >> result
/usr/bin/expect <<-EOF | grep -E "total|Mem|Swap|Disk|cpu cores" | grep -v spawn >> result
set timeout 2

spawn ssh root@$i free -h && fdisk -l | grep Disk && cat /proc/cpuinfo | grep 'cpu cores' | uniq
expect {
"*yes/no*" { send "yes\r" }
"*password*" { send "default4321\r" }
"*Permission denied*" {send "/01"
send "c"}
}

expect eof
EOF
echo -e '\n\n' >> result
done
