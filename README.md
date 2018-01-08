## Todo list

A todo list app made with Ruby on Rails

### Installation:
The following is required:
* Ruby 2.2.2+
* Ruby DevKit (If on Windows)
* RubyGems
* SQLite3
* Rails 5+

Run
```
bundle install
```

### Run the project locally:

In the config directory create an application.yml
and enter the following key/value pairs:
* EMAIL_USERNAME: some value
* EMAIL_PASSWORD: another value
* MAIL_HOST: example: localhost:3000
* MAIL_ADDRESS: example: smtp.gmail.com

Create database
```
rails db:migrate
```

Start server
```
rails server
```

Run tests
```
rails test
```
