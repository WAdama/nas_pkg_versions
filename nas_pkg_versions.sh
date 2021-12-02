#!/bin/bash
#Version 1.0.1

declare -a PACKAGES
TEXT=""
IFS=$'\n'
PACKAGES=$(synopkg checkupdateall | jq -c .[])
if [ -z "${PACKAGES}" ]; then
	UPDATES="0"
	TEXT="No updates available..."
else
	UPDATES="1"
for PACKAGE in ${PACKAGES[@]}
do
	NAME=$(echo $PACKAGE | jq -r .id)
	INSTALLED=$(synopkg version $NAME)
	VERSION=$(echo $PACKAGE | jq -r .version)
	TEXT="$TEXT $NAME ($INSTALLED -> $VERSION) |"
done
TEXT=$(echo ${TEXT[@]} | sed 's/..$//')
fi
echo "<?xml version=\"10.0\" encoding=\"UTF-8\" ?><prtg><result><channel>Updates?</channel><value>$UPDATES</value><ValueLookup>prtg.standardlookups.nas.packages</ValueLookup><ShowChart>0</ShowChart></result><text>$TEXT</text></prtg>"
