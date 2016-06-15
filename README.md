#Build systems demos

## PreReqs

### Install GIT

https://git-scm.com/downloads

Documentation for GIT: https://git-scm.com/documentation

Training Materials for GIT: https://try.github.io

### Register for GitHub

https://github.com/join?source=header-home

Setting up SSH keys for GitHub is ideal but not required.

Setting up SSH Documentation: https://help.github.com/articles/generating-an-ssh-key/

### Install Vagrant

https://www.vagrantup.com/downloads.html

Documentation for Vagrant: https://www.vagrantup.com/docs/

### Install VirtualBox

https://www.virtualbox.org/wiki/Downloads

Documentation for Virtualbox: https://www.virtualbox.org/manual/UserManual.html

### Install chef-dk

https://downloads.chef.io/chef-dk/

Training Materials for Chef: https://learn.chef.io/

After installations are complete you are ready to bring up the environment.

### Setting up build-chef-repo

```$ mkdir src```

```$ cd src```

If you setup SSH for your GitHub user, use command option 1 if not use option 2.

Option 1

```$ git clone git@github.com:luxoft-devops/build-chef-repo.git```

Option 2 - Will prompt for GitHub username and password, enter when prompted.

```$ https://github.com/luxoft-devops/build-chef-repo.git```

### Starting up a Vagrant VM

cd build-chef-repo/cookbooks/luxoft-<build system here>

```$ cd build-chef-repo/cookbooks/luxoft-jenkins```

```$ vagrant up```

*NOTE: The `vagrant up` command may ask for your password because it runs a `sudo` command.*

Each build system will have a unique URL. 

### Current List:

**Jenkins**

Directory for Vagrant Up: buildchef-repo/cookbooks/luxoft-jenkins

Local URL for Jenkins: http://jenkins.vagrant:8080/

Documentation on Jenkins: https://jenkins.io/doc/

**Docker Registry**

Directory for Vagrant Up: buildchef-repo/cookbooks/luxoft-docker

Local URL for Docker Registry: http://registry.vagrant:5050/

Documentation on Docker Registry: https://docs.docker.com/registry/

This is under construction and more additions will be available soon.

### Helpful Vagrant Commands

If you would like to update a running environment

```$ vagrant provision```

If you want to stop the environment but keep it around for later

```$ vagrant suspend```

If you want to destroy the environment

```$ vagrant destroy```

You will need to confirm destroy after command is issued.
