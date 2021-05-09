# Amazon Comprehend Rails Workshop

#### A simple Rails app that will be used for purpose of workshop while using Amazon Comprehend service from the AWS to:

Within the app, you can create a note via form, and underneath all notes could be found.

[Link to the blog](https://danielaniszkiewicz.com)

  
## Project Setup


### Ruby Environment
- Set up a ruby version manager. rvm or rbenv ( rvm preferred )
    + https://rvm.io/rvm/install
    + rvm get stable


### Application Setup
- `bundle install` (install all ruby gems for the project)
- `rake db:create` (create database)
- `rake db:migrate` (load schema)
- `rake db:seed` (seed the database with one dummy note)


### Running Application
- Start app server: `rails s`
