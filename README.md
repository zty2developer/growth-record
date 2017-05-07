# Growth Record (My Personal Blog)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

First, clone the project to your machine.
```sh
git clone git@github.com:zty2developer/growth-record.git
```

Then, make sure you had installed ruby and rails.

```sh
ruby -v
rails -v
```

* Ruby version
2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]04
* Rails version
5.0.2

If you have not installed rails or ruby, check this post to learn how to set up ruby on rails on ubuntu 14.04

> https://gorails.com/setup/ubuntu/14.04

### Installing
There is no extra things to do, so the installatin is complete. Just run command ```rails s``` to start your server and visit [localhost:3000](localhost:3000)

This web application's administration was built by [activeadmin](https://github.com/activeadmin/activeadmin), so if you want to access website administration, visit [localhost:3000/admin](localhost:3000/admin), the email and password are
```
admin@example.com
password
```

## Running the tests
The Growth Record use [rspec-rail](https://github.com/rspec/rspec-rails) gem to test the whole application, use rspec command to run your specs
```
bundle exec rspec
```

Other test related dependency gem are [FactoryGirl](https://github.com/thoughtbot/factory_girl), [Capybara](https://github.com/teamcapybara/capybara), [Faker](https://github.com/stympy/faker), [Database_cleaner](https://github.com/DatabaseCleaner/database_cleaner), [Guard-Rspec](https://github.com/guard/guard-rspec).

## Deployment
Deploying the app on ubuntu 14.04 with Capistrano, Nginx and Puma.
