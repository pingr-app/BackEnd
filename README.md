# BackEnd: PROTOTYPE EDITION

Here's an unordered list of methods we're planning on implementing that the front end guys can use with our API.

Some of the info I'll write in the descriptions for the methods is kind of irrelevant to front end people, so this isn't like an actual document or anything, don't worry.

This is literally the bare minimum. Okay, I know groups technically aren't the bare minimum but I really kind of want them in here right now so whatever.

Note: every method needs to have that facebook authentication stuff passed along with it, so I'm not really going to write that down here because it's implied.

- createUser (POST)
  - Input: a UUID that's generated on the app itself, plus facebook stuff (for storage) I guess for now. First Name and last name.
- deleteUser (DELETE)
  - Input: UUID ...
- createFriendship (POST)
  - for now it'll be done with UUIDs, but we could do it instead with usernames which we'll force to be unique or emails
  - Input: UUID, friend UUID, ..... to be completed.
- deleteFriendship (DELETE)
- createGroup (POST)
- deleteGroup (DELETE)
- getUser (GET)
  - This is to find the info and location of any person. Wording here gets kind of tough...
  - This takes as input: the app user's uuid and their authentication stuff, and the uuid of the user they are trying to get the info of. So first we check if the app user has an "accepted" friendship relation with the user they're looking for, and then if everything's all good we go to look up the current location of that user and package it up with that user's info and send it out.
  - You should also be able to use this method on yourself.
