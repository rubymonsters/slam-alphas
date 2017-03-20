# Slam Alphas App
[![Stories in Ready](https://badge.waffle.io/rubymonsters/slam-alphas.svg?label=ready&title=Ready)](http://waffle.io/rubymonsters/slam-alphas)

This repo is the open source code for the interactive map of [Slam Alphas](https://slamalphas.org), a collective of women poetry slam artists in Germany, Austria and Switzerland.

For a project overview of the Github issues, please refer to our [Waffle Board](https://waffle.io/rubymonsters/slam-alphas/).

## Requirements

- Ruby 2.2.4

# [Credentials in your environment and production directory] 
# env.SAMPLE and .env 
# copy the env.SAMPLE into your .env like this
# $ cp env.SAMPLE .env
# after the creation of the .env file fill in your credentials and comment out all the parts you are currently not using
# in order to get the production credentials for your .env file you could for example run in the terminal (make sure to be in the project directory):
# $ heroku config
# -> This should then show you the credentials that is associated with our current production database configs on heroku
# now make sure to not check this file into git by putting .env to the file .gitignore
# Some gems require to load the credentials first before they can execute (e.g. fog/aws), means we need to make sure the .env file is loaded before those gems are running, e.g. by using a gem like dotenv