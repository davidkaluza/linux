#!/bin/bash
#
# Autor: David Kaluza
# Date: 14th of April 2023
# Location: Sprockh√vel, Germany
#

YELLOW='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m'

if [ $# -ne 2 ]
then 
	echo -e "${YELLOW}Missing parameter${NC}"
	echo -e "${RED}Usage $0 KERNELVERSION PATH_INSTALL${NC}"
else
	VERSION=$1
	DEST=$2
	echo -e "Copying vmlinux, System.map, dts to ${YELLOW}$DEST${NC}"
	
	#System.map
	if [ -f "$DEST/System.map-$VERSION" ] 
	then
		echo "FILE EXISTS making backup ..."
		mv "$DEST/System.map-$VERSION" "$DEST/System.map-$VERSION-SAVE"
		cp System.map "$DEST/System.map-$VERSION"
	       	echo System.map ... done
	else
		cp System.map "$DEST/System.map-$VERSION" 
	       	echo System.map ... done
	fi
	
	# vmlinuz
	if [ -f "$DEST/vmlinuz-$VERSION" ] 
	then
		echo "FILE EXISTS making backup ..."
		mv "$DEST/vmlinuz-$VERSION" "$DEST/vmlinuz-$VERSION-SAVE"
		cp arch/arm64/boot/Image "$DEST/vmlinuz-$VERSION" 
	       	echo vmlinuz ... done
	else
		cp arch/arm64/boot/Image "$DEST/vmlinuz-$VERSION" 
	       	echo vmlinuz ... done
	fi
	
	# dts
	if [ -d "$DEST/dts-$VERSION" ] 
	then
		echo "FILE EXISTS making backup ..."
		mv "$DEST/dts-$VERSION" "$DEST/dts-$VERSION-SAVE"
		cp -r arch/arm64/boot/dts "$DEST/dts-$VERSION" 
	       	echo dts ... done
	else
		cp -r arch/arm64/boot/dts "$DEST/dts-$VERSION" 
	       	echo dts ... done
	fi
fi

# check Kernel, pack it, copy it, extract it
if [ -d "/lib/modules/$VERSION" ]
then
	echo kernel exists
	tar cfvz $DEST/$VERSION.tar.gz /lib/modules/$VERSIO
	echo kernel dont exists
fi
