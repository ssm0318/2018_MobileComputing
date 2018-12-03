# Help to Help - Backend

This project is developed by Ekatrina Levchenko, JaeWon Kim, Sicre--Lorge Tristan.

## Testing the Code
This is a Rails API-only application. Most responses require parameters to be passed either in the form of json or in the URL. Thus, it is recommended that the code be tested on Postman.

### Testing Locally
Ruby Version: 2.4.3
Rails Version: 5.1.6

Run the following code. Then navigate to```http://localhost:3000/```.
```ruby
rails db:migrate
rails db:seed
rails s
```

### Testing on the Web(?)
[http://18.221.77.15/]

### Tests
 | URL | Parameters | Response
--- | --- | --- | ---
1 | [http://18.221.77.15/api/v1/profiles] | N/A | profiles of all users
