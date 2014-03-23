#!/bin/bash

# fail fast.
set -e

# tell the user what to do.
if [ "$#" -lt 1 ]; then
  echo "Usage: ./install.sh <project_name>"
  exit 1
fi

# don't override if exists
if [ -d "$folder_input" ]; then
  echo "ERROR: Directory already exists."
  exit 1
fi

# grab archive, and extract
wget https://github.com/sjlu/vagrant-lamp/archive/master.zip -O master.zip
unzip master.zip
rm master.zip
mv vagrant-lamp-master $1
cd $1
