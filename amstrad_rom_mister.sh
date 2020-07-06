#! /bin/bash

if [ $# -ne 3 ]; 
	then echo "Usage $0 <rom filepath> <rom number> <remove amsdos header yes|no>"
	exit 1
fi

romnumber=$2
romfilepath=$1
containsheaders=$3

echo "Apply transformation for rom $romfilepath install into rom number $romnumber."

#extension="${romfilepath##*.}"

ext=`printf "%.2X" $romnumber`
if [ "$containsheaders" == "yes" ];
	then echo "removing Amsdos header."
		echo "Dumping rom..."
		cat $romfilepath | tail -c+129 > boot.e$ext
fi

if [ "$containsheaders" == "no" ];
	then echo "Dumping rom..."
		cat $romfilepath > boot.e$ext
fi

echo "File boot.e$ext created from $romfilepath (rom number:$romnumber, remove header:$containsheaders)."

exit 0
