#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "Please execute this script with root privileges" 1>&2
   exit 1
fi

wget --quiet --tries=1 --timeout=2 www.google.com -o /dev/null
if [ $? != 0 ]
then
    echo "ERROR: Could not reach Internet; check connection or configure proxy."
    exit 1
fi

# If this script is moved to a different directory this should be updated accordingly
PRJ_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "PRJ_ROOT = $PRJ_ROOT"

###
### Install OS packages
###

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get update
#apt-get -y install python-software-properties
apt-get -y install virtualenvwrapper
apt-get -y install mongodb-org

###
### Create virtualenv and install requirements
###

#venvs_dir="virtualenvs"
#requirements_file="./requirements.txt"
#venv='pyuss'

#WORKON_HOME=$sites_dir/$venvs_dir

#echo "virtual env setup. using:"
#echo "- WORKON_HOME = $WORKON_HOME"
#echo "- venv = $venv"
#echo "- requirements_file = $requirements_file"

#if [ ! -d $WORKON_HOME ]; then
#    echo "$WORKON_HOME directory does not exists. Creating directory"
#    mkdir $WORKON_HOME
#fi

# Needed to make virtualenvwrapper commands available
#source /usr/local/bin/virtualenvwrapper.sh
#workon $venv > /dev/null 2>&1
#if [ $? -ne 0 ]; then
    # virtual env was not created, create it now
#    echo "Creating virtual env $venv"
#     mkvirtualenv $venv
#fi

#diff $requirements_file $PRJ_ROOT/requirements.txt.current
#if [ $? -ne 0 ]; then
    #easy_install -U distribute
#    pip install -Ur $requirements_file && cp $requirements_file $WORKON_HOME/requirements.txt.current
#else
#    echo "requirements.txt did not change. Skipping install of requirements.txt"
#fi

