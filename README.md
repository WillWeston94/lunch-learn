# Lunch & Learn

## Introduction
Lunch and Learn is an application designed to search for cuisines by country, offering a gateway to explore that country's culture. This backend platform enables a team to develop a frontend application that allows users to search for recipes by country, save favorite recipes, and learn more about particular countries.

## Features
- **Explore Recipes:** Users can browse a vast selection of international dishes by country.
- **Save Favorites:** Users can save their preferred recipes for quick access anytime.
- **Recipe Management:** Users can create, update, and delete their favorite recipes in their personalized collection.

## Prerequisites
Before you begin, ensure you have met the following requirements:
- Ruby 3.0.0
- Rails 7.0.0
- PostgreSQL 12.0

## Installation
Follow these steps to get your development environment up and running:

1. Clone the repository:

2. Navigate to the project directory & install the required gems:
- bundle install

3. Set up the database:

- rails db:create db:migrate db:seed

4. Run the tests:

- bundle exec rspec

A quick guide or examples of how to use this backend application.

API Endpoints

Users
- POST /api/v1/users: Register a new user.

Sessions
- POST /api/v1/sessions: Log in to the application.

Recipes
- GET /api/v1/recipes: Retrieve recipes based on the country.

Favorites
- GET /api/v1/favorites: List all the user's favorite recipes.
- POST /api/v1/favorites: Save a recipe to favorites.
- DELETE /api/v1/favorites/:id: Remove a recipe from favorites.

Built With
Ruby on Rails - The server framework used
PostgreSQL - Database system
RSpec - Testing framework

* Services 
- [Edamam API](https://developer.edamam.com/edamam-recipe-api)
- [RestCountries API](https://restcountries.com/#api-endpoints-using-this-project)
- [Flickr API](https://www.flickr.com/services/developer/api/)
- [YoutubeData API](https://developers.google.com/youtube/v3/getting-started)
- [Postman](https://www.postman.com/) - Not my public workspace for API key reasons as they do not currently hold Dummy Values but I highly recommend adding it to your arsenal if you havent already, 



