# coding: utf-8
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
    timezone: "America/Vancouver",
    markdown: <<-DOC.strip_heredoc
    This is markdown. Whitespace will be preserved.
  DOC
  )

  wonderworld_photo = 'http://www.bookseattle.net/rooms/hellokitty2.jpg'

  wonderworld = Room.create!(
    name: "WonderWorld",
    location: seattle,
    max_guests: 4,
    photo_url: wonderworld_photo,
    shared: false,
    weekend_rate: 90.00,
    weekday_rate: 75.00,
    markdown: <<-DOC.strip_heredoc
    ## Wonder World


    ![WonderWorld photo](#{wonderworld_photo})
    ###About the room
    Would you like to make your baby’s food and clean your baby supplies in a comfortable kitchen? Do you want to feel more accepted when your baby cry at night? You can still do it all when you are staying in Dorm.
    ###The space
    * Accommodates: 3-4
    * Beds: 2
    * Bathrooms: private

    ###Amenities
    * Parking: street
    * Internet: yes
    * Kitchen: shared
  DOC
  )

  paris_photo = 'http://www.bookseattle.net/rooms/paris.jpg'

  paris = Room.create(
    name: "Paris",
    max_guests: 2,
    shared: false,
    location: seattle,
    photo_url: paris_photo,
    weekday_rate: 110.00,
    weekend_rate: 125.00,
    markdown: <<-DOC.strip_heredoc
    ## Paris

    ![Paris photo](#{paris_photo})

    ###About the room
    This romantic room is for  you and your loved one. You will stay in our the most romantic space and explore things that you would do in Paris..
    ###The space
    * Accommodates: 2
    * Beds: 1
    * Bathrooms: public

    ###Amenities
    * Parking: street
    * Internet: yes
    * Kitchen: shared
  DOC
  )

  dorm_photo = "http://www.bookseattle.net/rooms/dorm.jpg"
  dorm = Room.create!(
    name: "Dorm",
    max_guests: 5,
    shared: true,
    location: seattle,
    photo_url: dorm_photo,
    weekday_rate: 50.00,
    weekend_rate: 75.00,
    markdown: <<-DOC.strip_heredoc
    ## Dorm
    ![Dorm photo](#{dorm_photo})
    ###About the room
    Traveling alone can get lonely at times. Why not stay somewhere you can meet other travelers and share your stories? Out dorm is a place for you and up to three other mates from who-knows-where...
    ###The space
    * Accommodates: 5
    * Beds: 5
    * Bathrooms: public

    ###Amenities
    * Parking: street
    * Internet: yes
    * Kitchen: shared
  DOC
  )

Time.use_zone(seattle.timezone) do
  Reservation.create!(
    reservation_duration: DateTime.new(2017, 7, 11)..DateTime.new(2017, 7, 23),
    room: wonderworld,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: DateTime.new(2017, 8, 11)..DateTime.new(2017, 8, 12),
    room: wonderworld,
    guest_count: 4
  )

  Reservation.create!(
    reservation_duration: DateTime.new(2017, 5, 11, 15, 0, 0)..DateTime.new(2017, 5, 12, 12, 0, 0),
    room: paris,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: DateTime.new(2017, 10, 21, 15, 0, 0)..DateTime.new(2017, 10, 25, 12, 0, 0),
    room: paris,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: DateTime.new(2017, 8, 5, 15, 0, 0)..DateTime.new(2017, 8, 7, 12, 0, 0),
    room: dorm,
    guest_count: 2
  )

  Reservation.create!(
    reservation_duration: DateTime.new(2017, 11, 5, 15, 0, 0)..DateTime.new(2017, 11, 7, 12, 0, 0),
    room: dorm,
    guest_count: 2
  )
  end
end
