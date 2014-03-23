## Vagrant LAMP

This install uses Vagrant and Puppet to get you a basic LAMP install on a virtual environment. This is great for when you don't want to install the environment onto your local machine and to keep environments consistant across all machines. This was only intended for development purposes.

## Install

* First install [Vagrant](http://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).

* Then use the following script to instantiate a new project.

        curl https://raw.github.com/sjlu/vagrant-lamp/master/install.sh | bash -s <folder_name>

    * Make sure you replace `<project_name>` with the folder name you'd wish to create.

## License

MIT.
