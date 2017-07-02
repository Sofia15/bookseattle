# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

seattle = Location.first_or_create!(
  name: "Seattle",
  markdown: <<-DOC.strip_heredoc
  This is markdown. Whitespace will be preserved.
DOC
)

Room.first_or_create!(
  name: "Hello Kitty",
  location: seattle,
  markdown: <<-DOC.strip_heredoc
  This is markdown. Whitespace will be preserved.
  <%= image_tag('kitty.jpg') %>
DOC
)

Room.first_or_create!(
  name: "Paris",
  location: seattle,
  markdown: <<-DOC.strip_heredoc
  This is markdown. Whitespace will be preserved.
  <%= image_tag('paris.jpg') %>
DOC
)

Room.first_or_create!(
  name: "Dorm",
  location: seattle,
  markdown: <<-DOC.strip_heredoc
  This is markdown. Whitespace will be preserved.
  <%= image_tag('dorm.jpg' %>
DOC
)
