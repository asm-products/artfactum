<a href="https://assembly.com/artfactum/">![Logo](https://d1015h9unskp4y.cloudfront.net/attachments/e9e8d810-f5de-4467-be8e-81569dba9ee8/af_logo_cuadrado_plus.png)</a>

#Artfactum
Artfactum is the social network for art lovers: your ideal community for creating, collaborating and enjoying art with people all over the world.

This is a product being built by the Assembly community. You can help push this idea forward by visiting https://assembly.com/atrfactum.


##Built With

Ruby: 2.1.2
Rails: 4.2
PostgreSQL
Plus lots of Ruby Gems, a complete list of which is at /master/Gemfile.

##Getting Started

Follow the following steps to run artfactum locally:

###Clone the repo
      git clone https://github.com/asm-products/artfactum.git
      cd helpful-web

###Install the required gems 
      bundle install

###Set up the database 
      rake db:setup

###Run the app 
      bundle exec rails s

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
