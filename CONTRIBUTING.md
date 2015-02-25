# Contributing to Artfactum

Follow the following steps to run Artfactum locally:

## Clone the repo

    git clone https://github.com/asm-products/artfactum.git
    cd artfactum

## Install VirtualBox

Go to the [VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads) page and install:

* The latest VirtualBox platform package.
* The latest VirtualBox Oracle VM VirtualBox Extension Pack.

## Install Vagrant

[Vagrant](http://vagrantup.com) is the recommended way to run Artfactum on your own machine. You need to download and install it.

Grab the Vagrant installer from [here](http://www.vagrantup.com/downloads.html).

Follow the [installation instructions](https://docs.vagrantup.com/v2/installation/) for your platform on the Vagrant download page.

If you're on a OS X/Linux system you can install the plugins by running:

    vagrant plugin install vagrant-vbguest
    vagrant plugin install vagrant-cachier

## Vagrant UP!!!

Now that you've got VirtualBox and Vagrant installed, we can start up the Vagrant instance from the application folder:

    vagrant up

Since this is probably the first time you're running this command it's going to take a while to download the VM box.

## Install the required gems

When the `vagrant up` command has finished, enter into it and go to the shared folder where the app code resides, to install the required gems:

    vagrant ssh
    cd /vagrant
    gem install bundler
    bundle install

## Set up the environment

Copy the provided configuration files:

    cp config/database.example.yml config/database.yml
    cp .example.env .env

## Set up the database

    rake db:setup

## Run the app

    bundle exec guard

After the server has been started, you can find it at http://localhost:3000

## Contributing

This project's git flow is based on [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

1. Find or submit a bounty
2. Make a feature branch from `develop`
  - Name it based on bounty: `18-init-project`
3. Make changes
  - Use micro commits
  - Use the imperative, present tense: "change", not "changed" or "changes".
4. Write tests
  - Will not accept PRs that reduce coverage
5. Open PR back into develop
  - Make PR description link to the bounty and add a comment to the bounty linking the PR
