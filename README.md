# jennystool
little tools while working on CB


Simplify Chrome firmware updater building and extracting process.
usage

copy script to /chroot/tmp 

### /tmp/auto_updaterpack.sh -p ${PROJECT NAME} -b${BOARD NAME} -o ${OLD VERSION} -n ${NEW VERION}

${PROJECT NAME} : ex.
${BOARD NAME} : ex. 
${OLD VERSION} : ex. 48
${NEW VERSION} : ex. 68

###/tmp/extract_updater.sh -i ${ChromeOS image} 

 (make sure pwd is the same as where ${ChromeOS image} is in)
 
