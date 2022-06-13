#!/bin/bash
pwd=$(pwd)

cleanpath() {
  local lpwd=$(pwd)
  cd "$1" 2> /dev/null || { echo "Path not valid"; exit 1; }
  local returnVal=$(pwd);
  cd lpwd || { echo "The originating path does no longer exist..."; exit 1; }
  echo "${returnVal}"
}

SOURCE=$(cleanpath ${1});
DESTINATION=$(cleanpath ${2});

echo Source: "${SOURCE}"
echo Destination: "${DESTINATION}"
cd "${SOURCE}" || { echo "Source folder suddenly does not exist anymore..." ; exit 1;}
find . -type d -exec echo Creating folder {} \; -exec mkdir -p "${DESTINATION}"/{} \;
find . -type f -exec echo Moving {} \; -exec mv -u {} "${DESTINATION}"/{} \;
cd "${pwd}" || { echo "The start path no longer exists..."; exit 1; }

read -p "Moving complete, delete source folder(s)? (yes/no) " yn
while true; do
  case $yn in
    [yY]* ) echo "Removing source...";
      rm -rf ${SOURCE};
      echo "Done!";
      exit 0;;
    [nN]* ) echo "Skipping, done!";
      exit 0;;
    * ) echo invalid response;;
  esac
done