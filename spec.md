# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Artist has many concerts
    Venue has many concerts
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Concert belongs to a Venue
    Concert belongs to an Artist
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Artist has many venues through concerts
    Venue has many artist through concerts
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Artist has many venues through concerts
    Venue has many artists through concerts
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    Concerts have a name, description, start and end times
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Artists validate name, email, password
    Venues validate name and address
    Concert validates start and end times, name

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Concert has "upcoming" scope that shows concerts within 30 days
- [x] Include signup (how e.g. Devise)
    Can sign up by creating an artist
- [x] Include login (how e.g. Devise)
    Can log in using email and password
- [x] Include logout (how e.g. Devise)
    Logout link logs out user, and so does deleting an artist
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    Omniauth through facebook and github
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    Concerts are nested in artist and venue paths
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    Can create nested concerts, will automatically associate with artist or venue
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    Errors are passed on to re-rendered view for new and edit methods on artists, venues and concerts

Confirm:
- [x] The application is pretty DRY
    I did my best
- [x] Limited logic in controllers
    Again, i tried
- [x] Views use helper methods if appropriate
    lots of helpers, especially for concerts
- [x] Views use partials if appropriate
    Form and collection partials for all models (only collection for address)
