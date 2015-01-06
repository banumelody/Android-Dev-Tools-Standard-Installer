#!/bin/bash

echo "### androidDevTools installation script ###"
sleep 2s
echo "### This will take some time to finish, please wait. ###"

# create androidDevTools directory
DIR="androidDevTools"
if [ ! -d $DIR ]; then
  mkdir -v $DIR 
  echo "### mkdir $DIR successed ###"
fi

sleep 1s

cd $DIR
pwd

sleep 1s

OS=$(uname -s)
echo "Operating System is $OS"

wget -c https://dl.google.com/dl/android/studio/install/1.0.1/android-studio-ide-1641136.dmg

exit	