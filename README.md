# Slam Alphas App

[![Build Status](https://travis-ci.org/rubymonsters/slam-alphas.svg?branch=master)](https://travis-ci.org/rubymonsters/slam-alphas) [![Stories in Ready](https://badge.waffle.io/rubymonsters/slam-alphas.svg?label=ready&title=Ready)](http://waffle.io/rubymonsters/slam-alphas)

This repo is the open source code for the interactive map of [Slam Alphas](https://slamalphas.org), a collective of women poetry slam artists in Germany, Austria and Switzerland.

For a project overview of the Github issues, please refer to our [Waffle Board](https://waffle.io/rubymonsters/slam-alphas/).

## Requirements

### Development
Ruby 2.5.1, Postgres

### Production
Ruby 2.5.1, Postgres and Redis

## Credentials for production
### env.SAMPLE and .env
1. copy the env.SAMPLE into your .env like this
`$cp env.SAMPLE .env`
2. after the creation of the `.env` file fill in your credentials and comment out all the parts you are currently not using
3. in order to get the production credentials for your `.env` file you could for example run in the terminal (make sure to be in the project directory:
`$ heroku config` -> This should then show you the credentials that is associated with our current production database configs on heroku
4. now make sure to not check this file into git by putting `.env` to the file `.gitignore`
5. Some gems require to load the credentials first before they can execute (e.g. fog/aws), means we need to make sure the `.env` file is loaded before those gems are running, e.g. by using a gem like dotenv

### Running it locally

Clone this repo and cd into it.

Run `$ bundle install` to install dependencies.

Run `$ rake db:setup` to create and seed the database and run migrations.
_If you get an error make sure you have Postgres installed and running. Maybe you also need to check credentials in  `config/database.yml`._

Run `$ rails s` to start the local development server.
