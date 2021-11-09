#!/bin/bash
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
	VERSION=$(echo $PACKAGE | jq -r .version)
	TEXT="$TEXT $NAME ($VERSION) |"
done
#TEXT="Update(s) available for: $(echo ${TEXT[@]} | awk -v OFS=" / " '{$1=$1;print}')"
TEXT=$(echo ${TEXT[@]} | sed 's/..$//')
fi
echo "<?xml version=\"10.0\" encoding=\"UTF-8\" ?><prtg><result><channel>Updates?</channel><value>$UPDATES</value><ValueLookup>prtg.standardlookups.nas.packages</ValueLookup><ShowChart>0</ShowChart></result><text>$TEXT</text></prtg>"
