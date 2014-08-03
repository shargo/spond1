#!/bin/sh

#currently it's pretty stupid.
#when board vpd is supported, we will make it a bit smarter...

TOPFET=0
BOTFET=0


TOPPNR=`mainvpd -top -q -p`
BOTPNR=`mainvpd -bottom -q -p`

if [ ${TOPPNR:4} -eq 2003 ] ; then
	echo TOPFET 1
	TOPFET=1
elif [ ${TOPPNR:4} -eq 2013 ] ; then 
	echo TOPFET 0
	TOPFET=0
fi

if [ ${BOTPNR:4} -eq 2003 ] ; then
	BOTFET=1
	echo BOTFET 1
elif [ ${BOTPNR:4} -eq 2013 ] ; then
	echo BOTFET 0
	BOTFET=0
fi

echo "TOP:${TOPFET} BOTTOM:${BOTFET}" > /etc/fet
