# BackEnd: PROTOTYPE EDITION
# Nima Boscarino : January 13, 2016

This is the documentation for the Pingr Backend API.

Methods:

GET '/'
  - See a welcome message
  
  Path example:
    GET 'http://<hostname>:<port>/'

  Response body example:
    {
      "response":"Welcome to the Pingr API!"
    }

  Status code: 200 OK

GET '/users?id=<id>'
  - Get info for user <id>
  
  Path example:
    GET 'http://<hostname>:<port>/users?id=CoolGuy17
    --> Give me the info for the user "CoolGuy17"

  Response body example:
    {
      "id": "CoolGuy17",
      "first_name": "Jerome",
      "last_name": "Zemlak",
      "bio": "A user"
    }

  Status code: (200 OK) if passed valid user ID  or (404 Not Found)

POST '/users'
  - Creates new user, given info in JSON:
  - Returns the user's UUID.

  Path example:
    POST 'http://<hostname>:<port>/users'
    --> I want to create a new user
  
  Request body example:
    {
      "first_name":"John",
      "last_name":"Doe",
      "Bio":"This is an example user"
    }

  Response body example:
    {
      "id": "75c69b65-ed63-45b0-ba73-f1bbd2c9433c",
      "first_name": "John",
      "last_name": "Doe",
      "bio": "This is an example user"
    }
  
  Status code: (201 Created)
  NOTE: Once Facebook AUTH is implemented, duplicate users will not be allowed

GET '/users/friends?id=<id>'
  - Returns friends list for user <id>
  - Accepts several optional parameters
    - map: specifies particular map
    - status: specifies 'confirmed', 'requested', or 'pending' friends
    - loc : set to 'true' to get location info for friend (map, coordinates, timestamp)

  Path example:
    GET 'http://<hostname>:<port>/users/friends?id=HackerMan1337&map=fortune&loc=true'
    --> User "HackerMan1337" wants to see the locations of his friends at Fortune

  Response body example:
    {
      "id": "HackerMan1337",
      "friends": [
        {
          "id": "2d38eac1-3263-49c4-8234-93e77e645e54",
          "first_name": "Lucas",
          "last_name": "Gleichner",
          "map_id": 7,
          "x_coord": 3,
          "y_coord": 275,
          "time": "2016-01-13 02:24:00 -0500"
        },
        {
          "id": "6b87fd8c-1786-4363-bcf9-31756150d499",
          "first_name": "Mavis",
          "last_name": "Harber",
          "map_id": 3,
          "x_coord": 76,
          "y_coord": 150,
          "time": "2016-01-13 06:42:23 -0500"
        }
      ] 
    }

  Status code: (200 OK) if valid user ID, (404 Not Found) otherwise

POST '/users/friends?id=<id>'
  - Adds a person to user <id>'s friends list

  Path example:
    POST 'http://<hostname>:<port>/users/friends?id=8123
    --> User "8123" wants to add a new friend
  
  Request body example:
    {
      "friend_id":"b9ca56f0-2eff-4191-829a-1bb27f324565"
    }

  Response body example:
  {
    "id": "8123",
    "friend_id": "b9ca56f0-2eff-4191-829a-1bb27f324565",
    "first_name": "David",
    "last_name": "Haley",
    "friend_status": "confirmed"
  }

  Status code: (200 OK) if valid friend ID and user ID.
  NOTE: I'll figure out how to deal with invalid friend IDs later.
