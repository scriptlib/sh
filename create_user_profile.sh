#!/bin/sh
###create_user_profile v0.1
###     - create_user_profile
###     - Written by xiaoranzzz, 2010-04-28
###Usage:
###     create_user_profile
###Option:
###     -h Display help text
###Example:
###     create_user_profile
scripthelp "$0" "$@" && exit 0
if [ -z "$1" ] ; then scripthelp "$0" "--help" ; exit 0 ; fi

username=$1
if [ ! -d /home/$username ] ; then 
	if ! mkdir /home/$username ; then exit 1 ; fi
fi
chmod 700 /home/$username

/myplace/data/app/.PullThisProfile.pl /home/$username
/myplace/data/user/$username/.PullThisProfile.pl /home/$username
cp -av /myplace/user/$username	/home/


