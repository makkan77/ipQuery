# /bin/sh

# ipquery.sh
# IP checker and updater by Markus Ulfberg 2009-05-12 

# Variables
# Path where ip.txt resides or will be created if it doesen't exist already
DIR=youdirhere
# E-mail address, both from and to
ADDRESS=your@emailadress.here
# E-mail Subject
SUBJECT="New IP number"

# Check for ip.txt and create if it doesn't exist. 
if [ ! -s $DIR/ip.txt ] 
	then 
		# Create ip.txt
		echo "ip.txt doesn't exist. Creating ip.txt ..."
		echo "0.0.0.0" > $DIR/ip.txt
	else
		echo "ip.txt exists. Continuing ..."
fi
	
	# Get current IP
	currentIP=`curl http://checkip.dyndns.org | html2text | grep Current | awk '{print$4}'`
	echo "Current IP: $IP"

	# Read old IP from file
	oldIP=`cat $DIR/ip.txt`
	echo "Old IP: $oldIP"

	# Compare current and old IP
	if [ $oldIP != $currentIP ]
		then
			echo "IP has changed to: $currentIP"
			# Write new IP to ip.txt
			echo $currentIP > $DIR/ip.txt
			# Set e-mail content to new IP
			CONTENT=$currentIP
			# Send the e-mail notification
			echo -e "FROM:$ADDRESS\nTO:$ADDRESS\nSUBJECT:$SUBJECT\nContent-type:text/plain\n$CONTENT\n" | `/usr/sbin/ssmtp $ADDRESS`
		else
			echo "IP is still: $currentIP"
		fi
exit 0
