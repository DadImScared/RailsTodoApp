## Todo list

a todo list app made with ruby on rails

### Installation:
the following is required:
* Ruby language version 2.2.2 or newer
* Right version of Development Kit, if you are using Windows.
* The RubyGems packaging system, which is installed with Ruby by default.
* A working installation of the SQLite3 Database.
* Rails 5 or greater

run
```
bundle install
```

### Run the project locally:

in the config directory create an application.yml
and enter the following key/value pairs:
* EMAIL_USERNAME: some value
* EMAIL_PASSWORD: another value
* MAIL_HOST: example: localhost:3000
* MAIL_ADDRESS: example: smtp.gmail.com

create database
```
rails db:migrate
```

start server
```
rails server
```

run tests
```
rails test
```
