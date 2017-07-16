# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Room.delete_all
  Location.delete_all
  Reservation.delete_all

ActiveRecord::Base.transaction do

  seattle = Location.create!(
    name: "Seattle",
    markdown: <<-DOC.strip_heredoc
    This is markdown. Whitespace will be preserved.
  DOC
  )

  wonderworld = Room.create!(
    name: "WonderWorld",
    location: seattle,
    max_guests: 4,
    shared: false,
    weekend_rate: 90.00,
    weekday_rate: 75.00,
    markdown: <<-DOC.strip_heredoc
    ## Wonder World

    ![MacDown logo](https://s3-us-west-2.amazonaws.com/www.bookseattle.net/rooms/hellokitty2.jpg)
    ###About the room
    Would you like to make your baby’s food and clean your baby supplies in a comfortable kitchen? Do you want to feel more accepted when your baby cry at night? You can still do it when
    ###The space
    * Accommodates: 3-4
    * Beds: 2
    * Bathrooms: private

    ###Amenities
    * Parking: Street parking
    * Internet: Yes
    * Kitchen: Share
  DOC
  )

  paris = Room.create(
    name: "Paris",
    max_guests: 2,
    shared: false,
    location: seattle,
    weekday_rate: 110.00,
    weekend_rate: 125.00,
    markdown: <<-DOC.strip_heredoc
    ## Paris

    ![MacDown logo](https://s3-us-west-2.amazonaws.com/www.bookseattle.net/rooms/paris.jpg)

    ###About the room
    This romantic room is for  you and your loving one. You will stay in our the most romantic space and explore things that you would do in Paris..
    ###The space
    * Accommodates: 2
    * Beds: 1
    * Bathrooms: public

    ###Amenities
    * Parking: Street parking
    * Internet: Yes
    * Kitchen: Share
  DOC
  )

  dorm = Room.create!(
    name: "Dorm",
    max_guests: 5,
    shared: true,
    location: seattle,
    weekday_rate: 50.00,
    weekend_rate: 75.00,
    markdown: <<-DOC.strip_heredoc
    ![MacDown logo](https://s3-us-west-2.amazonaws.com/www.bookseattle.net/rooms/dorm.jpg)
    ###About the room
    Traveling alone can get lonely at times. Why not stay somewhere you can meet other travelers and share your stories? Out dorm is a place for you and up to three other mates from who-knows-where...
    ###The space
    * Accommodates: 5
    * Beds: 5
    * Bathrooms: public

    ###Amenities
    * Parking: Street parking
    * Internet: Yes
    * Kitchen: Share
  DOC
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 7, 11)..Date.new(2017, 7, 23),
    room: wonderworld,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 8, 11)..Date.new(2017, 8, 12),
    room: wonderworld,
    guest_count: 4
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 5, 11)..Date.new(2017, 5, 12),
    room: paris,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 10, 21)..Date.new(2017, 10, 25),
    room: paris,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 8, 5)..Date.new(2017, 8, 7),
    room: dorm,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: Date.new(2017, 11, 5)..Date.new(2017, 11, 7),
    room: dorm,
    guest_count: 2
  )
end
