#!/bin/sh
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
##Install NadekoBot
#Cleanup Existing
rm -rf /root/NadekoBot

#Get NadekoBot Version
git clone --branch=1.0 https://github.com/Kwoth/NadekoBot.git /root/NadekoBot
cd /root/NadekoBot
echo Checking Out
git checkout -qf 0df0eea6c0e1c451f0ebf4dffbb50a3ecd99eda5
git submodule update --init
echo Dotnet Restore
dotnet restore

#Build NadekoBot
echo Building
cd /root/NadekoBot/src/NadekoBot
dotnet build

#Move Data to user area
rsync --ignore-existing -r /root/NadekoBot/src/NadekoBot/data /config

#Remove data folder
rm -rf /root/NadekoBot/src/NadekoBot/data
