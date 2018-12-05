## Database name: makersbnb
## Test Database name: makersbnb_test

#### Table name: users
- id (PK)
- username
- password
- email

#### Table name: spaces
- id (PK)
- owner (FK -> users::id)
- spacename
- description
- price

#### Table name: bookings
- id (PK)
- space (FK -> spaces::id)
- hirer (FK -> users::id)
- startdate
- enddate
- confirmed

#### Table name: availability
- id (PK)
- space (FK -> spaces::id)
- availabledate
- unavailable

#### Table name: comments
- id (PK)
- space (FK -> spaces::id)
- hirer (FK -> users::id)
- comment_text
- commenter (FK -> user::id) (MVP only)
