#!/bin/bash

echo "Creating Vagrant LAMP Stack"
echo ''
echo 'Hostname: '
read hostname_input
echo ''
echo 'Folder: '
read folder_input

if [ -d "$folder_input" ]; then
  echo "ERROR: Directory already exists."
  exit 1
fi

wget https://github.com/sjlu/vagrant-lamp/archive/master.zip -O master.zip
unzip master.zip
rm master.zip
mv vagrant-lamp-master $folder_input
cd $folder_input

sed -i '' 's/lamp\.vagrant/'${hostname_input}'/g' Vagrantfile
