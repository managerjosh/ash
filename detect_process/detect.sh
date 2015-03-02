4 ps -A | cut -d ':' -f3 | cut -d ' ' -f2 | sort -k2 > snapshot 
5 while true; 
6 do 
7 	current_proc=`ps -A | cut -d ':' -f3 | cut -d ' ' -f2 | sort -k2` 
8 	snapshot_proc=`cat snapshot` 
9 	echo NEW PROCESSES: 
10 	diff -w <(echo "$current_proc") <(echo "$snapshot_proc") > possiblyBad 
11 	i=1 
12 	cat possiblyBad | while read line 
13 	do 
14 		if [ $(( $i%2 )) == 0 ]; then 
15 			echo $line | cut -d '<' -f2 
16 		fi 
17 		(( i=i+1 )) 
18 	done  
19 	sleep 3 
20 	clear 
