###Contributing

Follow the following steps to run artfactum locally:

###Clone the repo
      git clone https://github.com/asm-products/artfactum.git
      cd artfactum


###**Install VirtualBox**

    Grab the VirtualBox installer from **[here](https://www.virtualbox.org/)**.

    We recommend installing VirtualBox 4.3.18 Oracle VM VirtualBox Extension Pack for the extra drivers.

###**Install Vagrant**

[Vagrant](http://vagrantup.com) is the recommended way to run Artfactum on your own machine. You need to download and install.
Grab the Vagrant installer from **[here](http://www.vagrantup.com/downloads.html)**.

Follow the [installation instructions](https://docs.vagrantup.com/v2/installation/) for your platform on the Vagrant download page.

When the installation
If you're on a OS X/Linux system you can install the plugins by running:

        vagrant plugin install vagrant-vbguest
        vagrant plugin install vagrant-cachier




###**Vagrant UP !!!**

    Now that you've got VirtualBox and Vagrant installed with the source code cloned in `path/to/your/cloned/artfactum` we can start up the Vagrant instance.

        cd ~/artfactum
        Vagrant up

    Since this is probably the first time you're running this command it's going to take a while to download the VM box.

###Install the required gems
When the Vagrant up is finished
      Vagrant ssh
      cd /vagrant/
      bundle install


###Setup Environment
      cp database.example.yml database.yml
      cp .example.env .env

###Set up the database
      rake db:setup

###Run the app
      bundle exec guard

## Contributing
This project's git flow is based on [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

1. Find or Submit Bounty
2. Make a Feature Branch from `develop`
  - Name it based on bounty: `18-init-project`
3. Make Changes
  - Use micro commits
  - Use the imperative, present tense: "change", not "changed" or "changes".
4. Write tests
  - Will not accept PRs that reduce coverage
5. Open PR back into develop
  - Make PR Description links to the Bounty and add a comment to the Bounty linking the PR

