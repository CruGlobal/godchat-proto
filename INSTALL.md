# Installation

These instructions are designed for setting up The Godchat for development and testing.
If you want to deploy the software for your own project, then see the notes at the end.

These instructions are based on MacOSX.

We don't recommend attempting to develop or deploy this software on Windows. If you need to use Windows, then try developing this sofware using Ubuntu in a virtual machine.

## Dependencies

Many of the dependencies are managed through the standard Ruby on Rails mechanisms -
i.e. ruby gems specified in the Gemfile and installed using bundler. However, there are a large number of packages required before you can get the various gems installed.

## Minimum requirements

* Ruby 2.0.0
* RubyGems 1.3.1+
* Postgres 8.3+
* Bundler

#### MacOSX

For MacOSX, you will need XCode installed from the Mac App Store; OS X 10.7 (Lion) or later; and some familiarity with Unix development via the Terminal.

Installing Postgres:

* Install Postgres.app from http://postgresapp.com/
* Add Postgres to your path, by editing your profile:

`nano ~/.profile`

and adding:

`export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH`

Installing other dependencies:

* Install Homebrew from http://mxcl.github.io/homebrew/
* Install rbenvn from https://github.com/sstephenson/rbenv/
* Install Bundler: gem install bundler

## Cloning the repository

The repository is reasonably large and it's unlikely that you need the full history. If you are happy to wait for it all to download, run:

```
git clone https://github.com/ardation/godchat.git
```

To clone only the most recent version use a 'shallow clone':

```
git clone --depth=1 https://github.com/ardation/godchat.git
```

If you want to add in the full history later on, perhaps to run `git blame` or `git log`, run `git fetch --depth=1000000`

## Ruby gems

We use [Bundler](http://gembundler.com/) to manage the rubygems required for the project.

```
cd godchat
bundle install
```

## Application setup

We need to create the `.env` file from the example template. This contains various configuration options.

```
cp example.env .env
```

You can customize your installation of Godchat by changing the values in `.env`

You'll need to get API access to services that Godchat relies on. You'll have to create apps and copy the various keys and secrets to the `.env` file.

You can find these services here:

* Facebook Graph API from https://developers.facebook.com/apps
* Twitter API from https://dev.twitter.com/
* Pusher API from http://pusher.com/

Configure Godchat with a randomly generated token for devise_key field in the `.env` file:
```
openssl rand -base64 6
```

## Database setup

Godchat uses three databases -  one for development, one for testing, and one for production. The database-specific configuration
options are stored in `config/database.yml`, which we need to create from the example template.

```
cp config/example.database.yml config/database.yml
```

PostgreSQL is configured to, by default, accept local connections without requiring a username or password. This is fine for development.
If you wish to set up your database differently, then you should change the values found in the `config/database.yml` file, and amend the
instructions below as appropriate.

### PostgreSQL account setup

We need to create a PostgreSQL role (i.e. user account) for your current user, and it needs to be a superuser so that we can create more database.

```
sudo -u postgres -i
createuser -s <username>
exit
```

### Create the databases

To create the three databases - for development and testing - run:

```
foreman run rake db:create
```

### Database structure

To create all the tables, indexes and constraints, run:

```
foreman run rake db:migrate
```

## Running the tests

To ensure that everything is set up properly, you should now run:

```
foreman run rake test
```

This test will take a few minutes, reporting tests run, assertions, and any errors. If you receive no errors, then your installation is successful.

The unit tests may output parser errors related to "Attribute lat redefined." These can be ignored.

### Starting the server

Rails comes with a built-in webserver, so that you can test on your own machine without needing a server. Run

```
foreman start
```

You can now view the site in your favourite web-browser at `http://localhost:5000/`


## Useful Additions

To speed up development on the Mac, the following apps are recommended:

*Live Reload at http://livereload.com/