###Contributing 

Follow the following steps to run artfactum locally:

###Clone the repo
      git clone https://github.com/asm-products/artfactum.git
      cd artfactum

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

