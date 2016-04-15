#!/bin/bash

echo "### androidDevTools installation script ###"
sleep 2s
echo "### This will take some time to finish, please wait. ###"

### set link ###
# Android Studio for Mac
ASfM="https://dl.google.com/dl/android/studio/install/1.0.1/android-studio-ide-1641136.dmg"
ASfM="https://dl.google.com/dl/android/studio/install/1.4.1.0/android-studio-ide-141.2343393-mac.dmg"
ASfM="https://dl.google.com/dl/android/studio/install/2.0.0.20/android-studio-ide-143.2739321-mac.dmg"

# Android Studio for Linux
ASfL="https://dl.google.com/dl/android/studio/ide-zips/1.0.1/android-studio-ide-135.1641136-linux.zip"
ASfL="https://dl.google.com/dl/android/studio/ide-zips/1.4.1.0/android-studio-ide-141.2343393-linux.zip"
ASfL="https://dl.google.com/dl/android/studio/ide-zips/2.0.0.20/android-studio-ide-143.2739321-linux.zip"

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

function copy_to_app_dir {
  echo "------------------"
  read -p "Do you want to copy Android Studio.app to Applications? [y/n]" -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    cp -rv Android\ Studio.app Applications/
    echo "Copied!"
  elif [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo "Ok, thanks!"
  else 
    echo "Your input is wrong!"
    copy_to_app_dir
  fi
}

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

    sleep 1s

    hdiutil attach *.dmg

    cd /Volumes/Android*

    copy_to_app_dir
    

	};; 

  *) echo " ### Operating System isn't OS X or Linux. Sorry ###" ;;
esac
  echo "Thanks"
  echo "Done"
exit	