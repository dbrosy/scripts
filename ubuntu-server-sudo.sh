#!/bin/sh

# input might contains spaces and other characters
FILEPATH="/etc/sudoers.d/100-ubuntu"


# extract the file + dir names
FILE="`basename "${FILEPATH}"`"
DIR="`dirname "${FILEPATH}"`"

# create the dir, then the file
mkdir -p "${DIR}" && touch "${DIR}/${FILE}"
echo -e 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> "${DIR}/${FILE}"
# show result
ls -l "$FILEPATH"
