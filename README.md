# Sweater Weather

Back end repository designed to consume several APIs and currate data from them to expose a new API for a potental front end application. Functionality includes requests to get current, daily, and hourly weather. The weather at a destionation when a user will arrive from their roadtrip. Where to eat when a user arrives at there destination by requested food. Ability to create new users on the back end and store session data. 

Set up:

* Pull Down and run `bundle install`, `rails db:{create,migrate}` and `bundle exec figaro install`

* Requires api keys in appication.yml that can be retrived from:
* https://openweathermap.org/api/one-call-api
* https://developer.mapquest.com/documentation/geocoding-api/
* https://unsplash.com/developers
* https://www.yelp.com/developers/documentation/v3/get_started

* `bunlde exec rspec` to run test suite

* Ruby version 2.7.2 Rails Version 5.2.6

* Gems 
`   gem 'bcrypt'
    gem 'figaro'
    gem 'faraday'
    gem 'rspec-rails'
    gem 'pry'
    gem 'simplecov'
    gem 'factory_bot_rails'
    gem 'faker'
    gem 'shoulda-matchers'
    gem 'vcr'
    gem 'webmock'`
    
