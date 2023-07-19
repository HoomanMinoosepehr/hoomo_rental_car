Hoomo Rental Car
Version: v1.0.0
Framework: Ruby on Rail
Database: PSQL

Introduction:
“Hoomo” is a website that lets you find a car to rent or as a car owner, you can add your car and list it for rent.
To find the cars, you can see the listed cars all over the Vancouver of any type or you can search the cars based on their location or specific model, see their information, see their reviews, and choose the one which fits your requirements.
To add a car to the listing as an owner, you will make a car profile for your car and add its info and its picture, and done! Your advertisement is ready to add to the list of items and everyone can see it.

Users:
There are 2 types of users:
The first type is “guest user”: a guest user can only see the list of cars and see the show page for each car and also its comments and the number of likes for each comment.
The next type is a “signed-in user”: a signed-in user can see the list of cars and see the show page for each car and its comments and also the number of likes for each one, but also they can add a comment for each car or like the already existed comments. They also can make a car profile to give rent their own car, for this purpose, they can go to ‘Rent your car’ part, and there, they are able to give the car info and also its picture and their location and the car will be added to the list.
The signed-in users also can add a car to their favorite list and by going to their account, the can see the list of favorited cars over there. Also if they have any listed car, they can see those cars in their view account page.

Different parts:
User account:
A new user can make an account and by going into their account, they can edit their account or see their liked cars and also see their own car profiles. They can also delete their account.

Car profile:
Each signed-in user can make a profile to rent their car, and by going to their account they can edit that profile or even delete it.
Each car profile can have comments and also signed in users can add comments for that specific profile and like its comments.


Under the bonnet:
The app has two main tables, one is User table and the other one is CarProfile table, for these two tables, we will have CRUD functions.
These table has columns as follow:
User:
First_name: present
Last_name: present
Email: Unique, present
Password: should be at least 8 characters and should have at least one uppercase letter
admin
Car profile:
Model: present
Year: present
Mileage: present
Description
Location: present
Price: present
For each one of these items, during creating, if th user didn’t enter any information or didn’t pay attention to it, they should be an error in their view page to fix the issue.
There will be a comment table which has many to many relation between that table and car profile table and also many to many relation between that table and use table.
There will be likes table which is connecting user and comment tables with a many to many relation.
There will be favorite table which is connecting user and car profile table with a many to many relation.
There also is a search part in the navbar with a radio button which makes the user able to search between the listed cars based on location or the model.
For editing or deleting, only two people can do them, first one is the admin, admin can delete comments, for other things such as deleting or editing a car profile, deleting a comment, delete or edit the account, only the owner can do those things.

