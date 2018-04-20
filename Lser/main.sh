wget https://raw.githubusercontent.com/Yefori/Shell-Scripts/master/Lser/scanner.py -O scanner.py
python scanner.py 43.225.100.0/24 -t 50 -T 5 -p 22 > list



function  for_in_file(){
For  i  in  `cat list`
do

done
}
