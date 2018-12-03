# Help to Help - Backend

This project is developed by Ekatrina Levchenko, JaeWon Kim, Sicre--Lorge Tristan.

## Testing the Code
This is a Rails API-only application. Most responses require parameters to be passed either in the form of json or in the URL. Thus, it is recommended that the code be tested on Postman.

### DB Structure
https://github.com/ssm0318/help_to_help_back/issues/9#issue-386932804

### E-R Diagram
https://github.com/ssm0318/help_to_help_back/issues/9#issuecomment-443804189

### Testing Locally
Ruby Version: 2.4.3 / 
Rails Version: 5.1.6

Run the following code.
```ruby
rails db:migrate
rails db:seed
rails s
```
Host: ```http://localhost:3000/```

### Testing on the Web(?)
Host: http://18.221.77.15/ 

### Tests - Main Functionalities
Viewing the responses using a Json parser may be helpful. ```http://json.parser.online.fr/```

Number | URL | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | /api/v1/profiles | N/A | GET | profiles of all users
2 | /api/v1/profiles/:id | ID(int) of user data to be displayed | GET | profile of a specific user
3 | /api/v1/events | N/A | GET | info on all events
4 | /api/v1/profiles/:id | ID(int) of event data to be displayed | GET | info on a specific event
5 | /register/info | N/A | GET | sign in (existing user)/up (new user)
6 | /visitor/main | N/A | GET | sign out (if signed in)

### Tests - Sub Functionalities (Events)
Number | URL | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | /api/v1/events | event parameters | POST | create new event
2 | /api/v1/events/:id/ | ID(int) of event, event parameters | PATCH | update specific event
3 | /api/v1/events/request/:event_id/:requester_id/ | ID(int) of event and requester | GET | make a request to join event (sign in required)

### Tests - Sub Functionalities (Users)
Number | URL | Parameters | Method | Response
--- | --- | --- | --- | ---
1 | /api/v1/profiles/:id/edit | ID(int) of profile, profile parameters | PATCH | update profile of specific user
