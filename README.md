# QUARAK SERVER

Quarak is a pretty simple shared expenses manager. It's very useful to manage expenses in shared offices or trips.

"Quarak" doesn't mean anything at all. Do not try to understand the name.

This project is only an API and has been implemented with Ruby on Rails.

There's also a web client application built using AngularJS called [Quarak-Web](https://github.com/ricomambo/quarak-web).

Other clients, specially for mobile devices will be created soon.

## Users

### Sign in

  **URL:** */api/users/sign_in*  
  **Method:** *POST*  
  **Parameters:** *{ user { email, password } }*  
  **Request example:**

    curl -H "Content-type: application/json" -X POST \
    -d '{"user":{"email":"john@test.com","password":"Lennon1234"}}' \
    http://localhost:3000/api/users/sign_in

  **Response example:**

    {
      "user": {
        "id":1,
        "email":"john@test.com",
        "name":"John",
        "authentication_token":"YyB91ohQ9sht7Kaj9kjg"
      }
    }


### Registration
