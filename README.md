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
``` gem 'bcrypt'
    gem 'figaro'
    gem 'faraday'
    gem 'rspec-rails'
    gem 'pry'
    gem 'simplecov'
    gem 'factory_bot_rails'
    gem 'faker'
    gem 'shoulda-matchers'
    gem 'vcr'
    gem 'webmock'
 ```
 ## Endpoints
 For all requests run `rails s` in the terminal so that the Back End is listening 
 
 Get Forecast
 ex: http://localhost:3000/api/v1/forecast?location=denver,co
 Takes a param of location, this should be for the location that the requester wants the weather for. Returns Json for current, daily and hourly weather.
 State is not required, but will yeild more accurate results. 
 
 Get Backround Image
 ex: http://localhost:3000/api/v1/backgrounds?location=denver
 Takes a param of location, best results will be city only not including the state. Other suggestions for location params could be denver,landscapes or    denver,city. 
 
 Get Munchies 
 ex: http://localhost:3000/api/v1/munchies?start=denver,co&destination=pueblo,co&food=chinese
 Takes params of start for starting location, destination for ending location and food for what food a user wants to search for. This will return a json response for food at the destination location.
 
 Post User
 ex: http://localhost:3000/api/v1/users
 Posts a user to the back end database. Reqest params must be passed in the body not in the header. Requires Email, password and password confirmation. Will return a response with that users email and an api_key for that user. 
 
 Post Session
 ex: http://localhost:3000/api/v1/sessions
 Posts a session for a user. Reqest params must be passed in the body not in the header. Requires Email, and password. User must exist in database. Returns a response with user api_key and email. 
 
 Post Roadtrip 
 ex: http://localhost:3000/api/v1/roadtrips. 
 Posts a roadtrip. Reqest params must be passed in the body not in the header. Requires origin, destination and api_key as Json in the body of the requset. Will return details on the roadtrip and the weather for that roadtrip for when the user will arrive.
