#!/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
installPath=/root/NadekoBot
##Install NadekoBot
#Cleanup Existing
rm -rf $installPath

#Get NadekoBot Version
git clone --branch=1.0 https://github.com/Kwoth/NadekoBot.git $installPath
cd $installPath
echo Checking Out
git checkout -qf 0df0eea6c0e1c451f0ebf4dffbb50a3ecd99eda5
git submodule update --init
echo Dotnet Restore
dotnet restore

#Build NadekoBot
echo Building
cd $installPath/src/NadekoBot
dotnet build

#Move Data to user area
rsync --ignore-existing -r $installPath/src/NadekoBot/data /config

#Remove data folder
rm -rf $installPath/src/NadekoBot/data
