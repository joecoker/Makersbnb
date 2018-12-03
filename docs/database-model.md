## Database name: Makersbnb

#### Table name: Users
UserID (PK)
Name
Password
Email

#### Table name: Spaces
SpaceID (PK)
OwnerID (FK -> Users::UserID)
Name
Description
Price

#### Table name: Bookings
BookingID (PK)
SpaceID (FK -> Spaces::SpaceID)
HirerID (FK -> Users::UserID)
StartDate
EndDate
Confirmed

#### Table name: Availability
AvailabilityID (PK)
SpaceID (FK -> Spaces::SpaceID)
Date
NoLongerAvailable
