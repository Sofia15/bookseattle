# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Room.destroy_all

ActiveRecord::Base.transaction do

  seattle = Location.find_or_create_by!(
    # id: 1,
    name: "Seattle",
    markdown: <<-DOC.strip_heredoc
    This is markdown. Whitespace will be preserved.
  DOC
  )

  Room.find_or_create_by!(
    name: "Wonder World",
    location: seattle,
    markdown: <<-DOC.strip_heredoc
    ## Wonder World

    ![MacDown logo](https://s3-us-west-2.amazonaws.com/www.bookseattle.net/rooms/kitty.jpg)
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

  Room.find_or_create_by!(
    name: "Paris",
    location: seattle,
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

  Room.find_or_create_by!(
    name: "Dorm",
    location: seattle,
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
end
