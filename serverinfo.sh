#!/usr/bin/ksh
a=$(date '+%T')
h=$(hostname)
#b=$(sar 1 5 | grep Average | awk '{print "CPU:"""$2+$3}')
b=$(sar 1 5 | grep Average | awk '{print $2+$3}')
d=$(date '+%d')
e=$(svmon -O unit=MB | grep 'in use' | awk '{print $3}')
f=$(svmon -O unit=MB | grep 'memory' | awk '{print $2}')
vol1=$(df -gP /sw | grep swlv | awk '{print $5}')
vol2=$(df -gP /svc | grep svclv | awk '{print $5}')
echo $b% $(($e/($f/100)))% $vol1 $vol2 > /nas_web/webhomes/common_ng/html/prjsite/$h.html
