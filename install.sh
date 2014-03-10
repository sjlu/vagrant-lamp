#!/bin/bash

set -e
color='\033[33m'
white='\033[37m'

if [ "$#" -lt 1 ]; then
  echo "Usage: ./install.sh <project_name>"
  exit 1
fi

if [ -d "$folder_input" ]; then
  echo "ERROR: Directory already exists."
  exit 1
fi

echo -e "\n${color}Cloning and creating Vagrant LAMP stack.\n${white}"

wget https://github.com/sjlu/vagrant-lamp/archive/master.zip -O master.zip
unzip master.zip
rm master.zip
mv vagrant-lamp-master $1
cd $1

sed -i '' 's/lamp\.vagrant/'$1'.vagrant/g' Vagrantfile

git init
git config -f .gitmodules --get-regexp '^submodule\..*\.path$' | 
  while read path_key path 
  do
    url_key=$(echo $path_key | sed 's/\.path/.url/')
    url=$(git config -f .gitmodules --get "$url_key")
    rm -r $path
    git submodule add $url $path
  done

echo -e "\n\n${color}Now run 'vagrant up' to start the stack, it then can be accessed at 'http://$1.vagrant'${white}"
