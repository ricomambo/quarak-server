# QUARAK SERVER

Quarak is a pretty simple shared expenses manager. It's very useful to manage expenses in shared offices or trips.

"Quarak" doesn't mean anything at all. Do not try to understand the name.

This project is only an API and has been implemented with Ruby on Rails.

There's also a [web client application](https://github.com/ricomambo/quarak-web) built using AngularJS.

Other clients, specially for mobile devices will be created soon.

Quarak is Free Software and you can get the code at [GitHub](https://github.com/ricomambo/quarak-server).

## Users

### Registration

**URL:** */api/sign_up*  
**Method:** *POST*  
**Parameters:** *{email,password,name}*  
**Request example:**

    curl -H "Content-type: application/json" -X POST \
    -d '{"email":"john@test.com","password":"Lennon1234","name":"John Lennon"}' \
    http://localhost:3000/api/sign_up

**Response example:**

    {"id":1,"email":"john@test.com","name":"John Lennon","token":"zrzH6G8Wcq9RLECq-zlGNg"}}


### Sign In

**URL:** */api/sign_in*  
**Method:** *POST*  
**Parameters:** *{email,password}*  
**Request example:**

    curl -H "Content-type: application/json" -X POST \
    -d '{"email":"john@test.com","password":"Lennon1234"}' \
    http://localhost:3000/api/sign_in

**Response example:**

    {"id":1,"email":"john@test.com","name":"John Lennon","token":"zrzH6G8Wcq9RLECq-zlGNg"}

### Sign Out

**URL:** */api/sign_out*  
**Method:** *DELETE*  
**Parameters:** *none*  
**Request example:**

    curl -H "Content-type: application/json" -X DELETE \
    http://localhost:3000/api/sign_out

`Note: the response is just a 204 (No content) http code`

### Get Profile

**URL:** */api/profile*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/profile

**Response example:**

    {"id":1,"email":"john@test.com","name":"John Lennon","token":"zrzH6G8Wcq9RLECq-zlGNg"}

`Note: returns the current logged in user`

### Update Profile

**URL:** */api/profile*  
**Method:** *PUT/PATCH*  
**Parameters:** *{email,password,name}*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X PUT \
    -d '{"name":"J.Lennon"}}' \
    http://localhost:3000/api/profile

**Response example:**

    {"id":1,"email":"john@test.com","name":"J.Lennon","token":"zrzH6G8Wcq9RLECq-zlGNg"}

`Note: updates the current logged in user`

### Users list

**URL:** */api/users*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/users

**Response example:**

    [{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]

## Projects

### Projects list

**URL:** */api/projects*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/projects

**Response example:**

    [{"id":1,"title":"First Project","members":[{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]}]

`Note: returns only the projects including the current logged in user as member`

### Create Project

**URL:** */api/projects*  
**Method:** *POST*  
**Parameters:** *{title,member_ids}*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X POST \
    -d '{"title":"New Project","member_ids":[1,2]}' \
    http://localhost:3000/api/projects

**Response example:**

    {"id":5,"title":"New Project","members":[{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"}]}

### Get Project

**URL:** */api/projects/:project_id*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/projects/5

**Response example:**

    {"id":5,"title":"New Project","members":[{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]}

### Update Project

**URL:** */api/projects/:project_id*  
**Method:** *PUT/PATCH*  
**Parameters:** *{title,member_ids}*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X PUT \
    -d '{"title":"Old Project","member_ids":[1,2,3]}' \
    http://localhost:3000/api/projects/5

**Response example:**

    {"id":5,"title":"Old Project","members":[{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]}

### Delete Project

**URL:** */api/projects/:project_id*  
**Method:** *DELETE*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X DELETE \
    http://localhost:3000/api/projects/5

`Note: the response is just a 204 (No content) http code`

## Expenses

### Expenses list

**URL:** */api/projects/:project_id/expenses*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/projects/1/expenses

**Response example:**

    [{"id":1,"project_id":1,"date":"2014-03-25","category":"Supermarket","provider":"Walmart","amount":745.24,"comments":"Sample expense","payer":{"id":2,"name":"Ringo Star"},
      "members":[{"id":1,"name":"John Lennon"},{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]},
    {"id":2,"project_id":1,"date":"2014-03-26","category":"Rent","provider":"Mr. Magoo","amount":1400.0,"comments":"Another expense","payer":{"id":2,"name":"Ringo Star"},
      "members":[{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]},
    {"id":3,"project_id":1,"date":"2014-04-27","category":"Supermarket","provider":"Carrefour","amount":425.41,"comments":"The last expense","payer":{"id":3,"name":"George Harrison"},
      "members":[{"id":1,"name":"John Lennon"},{"id":3,"name":"George Harrison"}]}]

### Create Expense

**URL:** */api/projects/:project_id/expenses*  
**Method:** *POST*  
**Parameters:** *{date,category,provider,amount,comments,member_ids}*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X POST \
    -d '{"date":"2014-05-20","category":"Supermarket","provider":"Walmart","amount":123.45,"comments":"One more expense","payer_id":3,"member_ids":[2,3]}' \
    http://localhost:3000/api/projects/1/expenses

**Response example:**

    {"id":7,"date":"2014-05-20","category":"Supermarket","provider":"Walmart","amount":123.45,"comments":"One more expense","payer":{"id":3,"name":"George Harrison"},
      "members":[{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]}

### Get Expense

**URL:** */api/projects/:project_id/expenses/:expense_id*  
**Method:** *GET*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X GET \
    http://localhost:3000/api/projects/1/expenses/7

**Response example:**

    {"id":7,"date":"2014-05-20","category":"Supermarket","provider":"Walmart","amount":123.45,"comments":"One more expense","payer":{"id":3,"name":"George Harrison"},
      "members":[{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"}]}

### Update Expense

**URL:** */api/projects/:project_id/expenses/:expense_id*  
**Method:** *PUT/PATCH*  
**Parameters:** *{date,category,provider,amount,comments,member_ids}*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X PUT \
    -d '{"amount":234.56,"comments":"Changing expense","payer_id":2,"member_ids":[1,2,3]}' \
    http://localhost:3000/api/projects/1/expenses/7

**Response example:**

    {"id":7,"date":"2014-05-20","category":"Supermarket","provider":"Walmart","amount":234.56,"comments":"Changing expense","payer":{"id":2,"name":"Ringo Star"},
      "members":[{"id":2,"name":"Ringo Star"},{"id":3,"name":"George Harrison"},{"id":1,"name":"John Lennon"}]}

### Delete Expense

**URL:** */api/projects/:project_id/expenses/:expense_id*  
**Method:** *DELETE*  
**Parameters:** *none*  
**Request example:**

    curl -H "Authorization: Token token=zrzH6G8Wcq9RLECq-zlGNg" -H "Content-type: application/json" -X DELETE \
    http://localhost:3000/api/projects/1/expenses/7

`Note: the response is just a 204 (No content) http code`
