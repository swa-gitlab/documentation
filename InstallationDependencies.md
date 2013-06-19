# Installation Dependencies
When going through the [installation guide](https://github.com/delftswa/gitlab/blob/master/doc/install/installation.md), the following dependencies were detected.

## Unix packages
In order to install gitlab on a webserver, the following Unix packages need to be installed in the case of a Debian / Ubuntu server:
* sudo
* vim (or a similar text editor)
* build-essential
* zlib1g-dev
* libyaml-dev
* libssl-dev
* libgdbm-dev
* libreadline-dev
* libncurses5-dev
* libffi-dev
* curl
* git-core
* openssh-server
* redis-server
* checkinstall
* libxml2-dev
* libxslt-dev
* libcurl4-openssl-dev
* libicu-dev
* python (2.5 or later, but version 3.x)
* postfix (or a similar mail server such as exim4 that is shipped with Debian)
* ruby 1.9.3
* nginx

## Ruby gems
Besides these packages, numerous Ruby gems need to be installed. Although this is quite a list, they can easily be installed in one batch, using the `bundle install`  command, once the `bundler` gem is installed.
* bundler
* rails 3.2.13
* mysql2 or pg
* devise
* omniauth 1.1.3
* omniauth-google-oauth2
* omniauth-twitter
* omniauth-github
* gitlab_git 1.2.1
* gitlab-grack 1.0.0
* gitlab_omniauth-ldap 1.0.2
* gitlab-pygments.rb 0.3.2
* gitlab-gollum-lib 1.0.0
* github-linguist
* grape
* grape-entity
* stamp
* enumerize
* kaminari  0.14.1
* haml-rails
* carrierwave
* fog (if you are using AWS storage)
* six
* seed-fu
* redcarpet 2.2.2
* github-markup 0.7.4
* puma 2.0.1
* state_machine
* acts-as-taggable-on
* slim
* sinatra
* sidekiq
* httparty
* colored
* settingslogic
* foreman
* redis-rails
* sass-rails
* coffee-rails
* uglifier
* therubyracer
* turbolinks
* jquery-turbolinks
* chosen-rails 0.9.8
* select2-rails
* jquery-atwho-rails 0.3.0
* jquery-rails 2.1.3
* jquery-ui-rails 2.0.2
* modernizr 2.6.2
* raphael-rails
* bootstrap-sass 2.2.1.1
* font-awesome-sass-rails 3.0.0
* gemoji 1.2.1
* gon
* rails_best_practices
* gitlab_meta 5.0

Additional packages for development:
* annotate
* letter_opener
* quiet_assets 1.0.1
* rack-mini-profiler
* better_errors
* binding_of_caller
* sdoc
* thin
* coveralls
* rails-dev-tweaks
* spinach-rails
* rspec-rails
* capybara
* pry
* awesome_print
* database_cleaner
* launchy
* factory_girl_rails
* minitest
* ffaker
* guard-rspec
* guard-spinach
* rb-fsevent
* growl
* rb-inotify
* poltergeist
* spork 1.0rc

Additional packages for testing:
* coveralls
* rails-dev-tweaks
* spinach-rails
* rspec-rails
* capybara
* pry
* awesome_print
* database_cleaner
* launchy
* factory_girl_rails
* minitest
* ffaker
* guard-rspec
* guard-spinach
* rb-fsevent
* growl
* rb-inotify
* poltergeist
* spork 1.0rc
* simplecov
* shoulda-matchers 1.3.0
* email_spec
* webmock
* test_after_commit
