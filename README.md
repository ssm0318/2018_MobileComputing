# Help to Help - Backend

This project is developed by Ekatrina Levchenko, JaeWon Kim, Sicre--Lorge Tristan.

### DB Structure
https://github.com/ssm0318/help_to_help_back/issues/9#issue-386932804

### E-R Diagram
https://github.com/ssm0318/help_to_help_back/issues/9#issuecomment-443804189

---

## Running the Application
This is a Rails API-only application. Most responses require parameters to be passed either in the form of json or in the URL. Thus, it is recommended that the code be tested on Postman.

### Running Locally
Ruby Version: 2.4.3 / 
Rails Version: 5.1.6

Run the following code.
```ruby
rails db:migrate
rails db:seed
rails s
```
Host: ```http://localhost:3000/```

### Running on the Web(?)
Host: http://18.221.77.15/ 

---

### Main Functionalities
Viewing the responses using a Json parser may be helpful. ```http://json.parser.online.fr/```

Number | URL | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | /api/v1/profiles | N/A | GET | profiles of all users
2 | /api/v1/profiles/:id | ID(int) of user data to be displayed | GET | profile of a specific user
3 | /api/v1/events | N/A | GET | info on all events
4 | /api/v1/profiles/:id | ID(int) of event data to be displayed | GET | info on a specific event
5 | /register/info | N/A | GET | sign in (existing user)/up (new user)
6 | /visitor/main | N/A | GET | sign out (if signed in)
7 | /events/search/:keyword | search keyword | GET | search events that match keyword (in the title, tags, or description)

### Sub Functionalities (Events)
Number | URL (/api/v1/events) | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | / | event parameters | POST | create new event
2 | /:id/ | ID(int) of event, event parameters | PATCH | update specific event
3 | /request/:event_id/:requester_id/ | ID(int) of event and requester | GET | create a request to join event
4 | /accept/:event_id/:user_id/ | ID(int) of event and user | GET | accept a user who requested to join event
5 | /bookmark/:user_id/:event_id/ | ID(int) of event and user | GET | create a bookmark of an event for a user
6 | /hosted/:id/ | ID(int) of hosted event | GET | mark event as hosted and increment exp

### Sub Functionalities (Users)
Number | URL (/api/v1/profiles) | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | /:id/edit | ID(int) of profile, profile parameters | PATCH | update profile of specific user
2 | /:id/reviews | ID(int) of user to be interviewed | POST | create a review on a user
3 | /follow/:follower_id/:following_id | ID(int) of follower and the followed | GET | user follows another user
4 | /match/:id/ | ID(int) of current user (REQUIRED), [gender, language, location] (OPTIONAL) | POST | match users