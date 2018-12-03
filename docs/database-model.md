## Database name: makersbnb
## Test Database name: makersbnb_test

#### Table name: Users
- UserID (PK)
- username
- Password
- Email

#### Table name: Spaces
- SpaceID (PK)
- OwnerID (FK -> Users::UserID)
- Name
- Description
- Price

#### Table name: Bookings
- BookingID (PK)
- SpaceID (FK -> Spaces::SpaceID)
- HirerID (FK -> Users::UserID)
- StartDate
- EndDate
- Confirmed

#### Table name: Availability
- AvailabilityID (PK)
- SpaceID (FK -> Spaces::SpaceID)
- Date
- NoLongerAvailable
