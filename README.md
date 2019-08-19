users#create to create a user.
post "/users" takes BODY = 
{
  "user":{
    "user_name":(here is where you put the user_name as a string), 
    "password":(here is where you put the password as a string)
  }
}
passes back JWT (as in you're logged in), username, all the user's activity instances with details as well as the associated activity description

authentication#create to login
post "/login" takes BODY = 
{
  "user":{
    "user_name":(here is where you put the user_name as a string), 
    "password":(here is where you put the password as a string)
  }
}
same response as users#create

ALL ROUTE ACTIONS BELOW REQUIRES A USER TO BE LOGGED IN

users#profile to get user info without having to login
get "/profile" takes Headers in addition to normal ones

Authorization: Bearer (here is where you put the JWT, REMEMBER EVERY ROUTE AFTER THE FIRST NEED YOU NEED TO DO THIS)

users#profile_update to change user password
post "/profile" takes BODY =
{
  "user":{
    "new_password": (here is where you put the new password as a string)
  }
}

activity_instances#create to create the activity and the specific activity instance. if the activity already exist, then it finds it and create the specific activity instance.
post "/activity_instances" takes BODY =
{
  "activity":{
    "description": (here is where you put the activity field of the return from bored api as a string),
    "accessibility": (here is where you put the accessibility field of the return from bored api as a decimal, 0 to 1),
    "category": (here is where you put the category field of the return from bored api as a string),
    "participants": (here is where you put the participants field of the return from bored api as an integer),
    "price": (here is where you put the price field of the return from bored api as a decimal, 0 to 1),
    "apiKey": (here is where you put the key field of the return from bored api as a NUMBER)
  }
}
the default for the activity instance's rating is nil and for the completed is false. This route returns details about the activity instance, so id, rating and completed, as well as detals about the actual activity

activity_instance#update to change the rating value and to complete the activity instance
patch (or put) "/activity_instances/:id" takes Body =
{
  "activity_instance":{
    "rating": (here is where you put the new rating the user selected for this specific activity instance, decimal, 0 to 5),
    or
    "completed": (here is where you put the new completed status, i'm guessing it would be true, for completed)
  }
}
This route returns the updated activity instance, the same as above just updated.

comments#create to create a comment. The activity has to already exist for a user to comment on it, silly.
post "/comments" takes BODY =
{
  "comment":{
    "activity_description": (this is where you put the activity description, which itself is a unique identifier, as a string),
    "content": (this is where you put the content of the comment, like "hey, this is cool", as a string)
  }
}
this route returns the just created comment, its id, content, and the activity details that the comment is about

comments#update to edit the comment.
patch (or put) "/comments/:id" takes BODY =
{
  "comment": {
    "content": (here's where you put the new content)
  }
}
returns the edited comment, same as above, just edited.

activities#highestratedmostpopular gives you all activities sorted in desc order highest rated and most completed
get '/activities/highestratedmostpopular'

this route returns everyAverageRating and everyTotalCompleted, they are arrays. This feels like it's very computational intensive, so dont do this route very often.
