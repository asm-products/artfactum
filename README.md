<a href="https://assembly.com/artfactum/"><img src="https://github.com/asm-products/artfactum/blob/master/public/assets/img/logo-dark.png" alt="logo" height="98px" width="244px"></a>

[![CodeClimate](http://img.shields.io/codeclimate/github/asm-products/artfactum.svg?style=flat)](https://codeclimate.com/github/asm-products/artfactum) [![Coverage](http://img.shields.io/codeclimate/coverage/github/asm-products/artfactum.svg?style=flat)](https://codeclimate.com/github/asm-products/artfactum) [![Travis-CI](http://img.shields.io/travis/asm-products/artfactum.svg?style=flat)](https://travis-ci.org/asm-products/artfactum) [![Travis-CI](http://img.shields.io/gemnasium/asm-products/artfactum.svg?style=flat)](https://gemnasium.com/asm-products/artfactum)
[![Inline docs](http://inch-ci.org/github/asm-products/artfactum.svg?branch=master&style=flat)](http://inch-ci.org/github/asm-products/artfactum)

#Artfactum
A Better way to discover new art.

Artfactum is an online marketplace where artists and art lovers create virtual galleries to showcase and sell art to a global community.

This is a product being built by the Assembly community. You can help push this idea forward by visiting https://assembly.com/artfactum.

##API
The RESTful JSON API in this Rails repo serves data to the [frontend](https://github.com/asm-products/artfactum-frontend).  The API controllers can be found in the `app/controllers/api` directory.  To authenticate with the API for non-public calls (like updating a user's settings), simply send the email and authentication token in the request headers.  The headers should be in the form `X-Artfactum-Email` and `X-Artfactum-Token` respectively.  A simple API call might be something like `$ curl http://localhost:3000/api/galleries` to list all galleries.

##Built With

- Ruby: 2.1.2
- Rails: 4.2
- PostgreSQL
- Plus lots of Ruby Gems, a complete list of which is at /master/Gemfile.

Please see our [/master/CONTRIBUTING.md](https://github.com/asm-products/artfactum/blob/master/CONTRIBUTING.md) for instructions on how to set up your development environment for Artfactum.

