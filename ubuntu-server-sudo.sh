#!/bin/sh

# Check if running as root
if [[ $(id -u) -ne 0 ]] ; then
  echo "Please run as root";
  exit 1;
fi

# input might contains spaces and other characters
FILEPATH="/etc/sudoers.d/100-sudo"


# extract the file + dir names
FILE="`basename "${FILEPATH}"`"
DIR="`dirname "${FILEPATH}"`"

# create the dir, then the file
mkdir -p "${DIR}" && touch "${DIR}/${FILE}"
echo -e "$USER ALL=(ALL) NOPASSWD:ALL" >> "${DIR}/${FILE}"
# show result
ls -l "$FILEPATH"
