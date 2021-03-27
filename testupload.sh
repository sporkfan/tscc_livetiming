#!/bin/bash
#Quick test script to upload the AxWare test file to the tscc web site, and then preform a wget to verify that the file is there. 
#Remove old testing files before we do more testing. 
rm -f /tmp/testifle.txt
#Upload the test file to our website
/bin/echo "Uploading the file to auto-x.com"
echo ""
/usr/bin/scp -q /home/tscc/timing_files/results_live.htm wesemerson@auto-x.com:/home/tscc/auto-x.com/results/live/
#Grab the uploaded file and diff it against the file in the /home/tscc directory. 
/bin/echo "Grabbing the file that we just uploaded to the web space."
echo ""
wget -q -O /tmp/testfile.txt http://www.auto-x.com/results/live/results_live.htm
diff -s /home/tscc/timing_files/results_live.htm /tmp/testfile.txt
echo ""
echo "If they are identical, you are good to go. Otherwise, you have problems."
