#!/bin/bash

echo "### androidDevTools installation script ###"
sleep 2s
echo "### This will take some time to finish, please wait. ###"

### set link ###
# Android Studio for Mac
ASfM="https://dl.google.com/dl/android/studio/install/1.0.1/android-studio-ide-1641136.dmg"
ASfM="https://dl.google.com/dl/android/studio/install/1.4.1.0/android-studio-ide-141.2343393-mac.dmg"

# Android Studio for Linux
ASfL="https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip"
ASfL="https://dl.google.com/dl/android/studio/ide-zips/1.4.1.0/android-studio-ide-141.2343393-linux.zip"

###

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

OSType=$(uname -s)
echo "Operating System is $OSType"

case "$OSType" in
  Linux*)   {
	
	# Download Android Studio for Linux
	wget -c $ASfL

	};;
  Darwin*)  {
  	# Installation for Mac
  	
  	JavaVersion=$("javac" -version)
  	echo "${JavaVersion}"
  	
  	sleep 1s

  	# Download Android Studio for Mac
	wget -c $ASfM

	};; 

  *) echo " ### Operating System isn't OS X or Linux. Sorry ###" ;;
esac

exit	