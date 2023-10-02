# Hoomo Rental Car
## Version: v1.0.0
## Framework:
  - Ruby on Rails
  - Bootstrap

## Database: 
 - PostgreSQL

## Introduction:
"Hoomo-Rental-Car" is a platform that allows users to either rent a car or list their own cars for rent if they own one. This platform has been developed using Ruby on Rails for both the server and view pages. It utilizes PostgreSQL as its database system.

## Users:
### Guest User: 
A guest user can view the list of cars and access the individual car's show page, along with its comments and the number of likes for each comment.

### Signed-in User:
A signed-in user can view the list of cars and access the show page for each car, including its comments and the number of likes for each comment. Additionally, signed-in users have the privilege to:

 - Add comments to cars.
 - Like existing comments.
 - Create a car profile to rent out their own car. To do this, they can navigate to the 'Rent Your Car' section, where they can provide car information, upload pictures, specify their location, an have the car added to the list.

Signed-in users can also:

 - Add cars to their favorites list.
 - Access their account to view the list of favorited cars.
 - If they have listed any cars for rent, they can manage those listings on their account page.

## Different parts:
### User account:
A new user can make an account and by going into their account, they can edit their account or see their liked cars and also see their own car profiles. They can also delete their account.

### Car profile:
Each signed-in user can make a profile to rent their car, and by going to their account they can edit that profile or even delete it.
Each car profile can have comments and also signed in users can add comments for that specific profile and like its comments.
