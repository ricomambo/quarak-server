# QUARAK SERVER

Quarak is a pretty simple shared expenses manager. It's very useful to manage expenses in shared offices or trips.

"Quarak" doesn't mean anything at all. Do not try to understand the name.

This project is only an API and has been implemented with Ruby on Rails.

There's also a web client application built using AngularJS called [Quarak-Web](https://github.com/ricomambo/quarak-web).

Other clients, specially for mobile devices will be created soon.

## Users

### Registration

**URL:** */api/users*  
**Method:** *POST*  
**Parameters:** *{ user { email, password [, name] } }*  
**Request example:**

    curl -H "Content-type: application/json" -X POST \
    -d '{"user":{"email":"john@test.com","password":"Lennon1234","name":"John Lennon"}}' \
    http://localhost:3000/api/users

**Response example:**

    {
      "user": {
        "id":1,
        "email":"john@test.com",
        "name":"John Lennon",
        "authentication_token":"YyB91ohQ9sht7Kaj9kjg"
      }
    }


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
        "name":"John Lennon",
        "authentication_token":"YyB91ohQ9sht7Kaj9kjg"
      }
    }

### Profile

**URL:** */api/profile*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=YyB91ohQ9sht7Kaj9kjg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/profile

**Response example:**

    {
      "id": 1,
      "email": "john@test.com",
      "name": "John Lennon",
      "tracking": {
          "sign_in_count": 3,
          "current_sign_in_at": "2014-06-13T23:32:32.343Z",
          "last_sign_in_at": "2014-06-13T22:58:45.096Z",
          "current_sign_in_ip": "127.0.0.1",
          "last_sign_in_ip": "127.0.0.1"
      }
    }
