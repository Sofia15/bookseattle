class Room < ApplicationRecord
  has_many :reservations
  has_many :room_rates
  belongs_to :location


  validates :name, presence: true, uniqueness: true, null: false, length: {minimum: 3, maximum: 50}
  validates :location, presence: true

  before_save :markdown_to_html

  def markdown_to_html
    renderer = Redcarpet::Render::HTML.new
    md = Redcarpet::Markdown.new(renderer)

    self.html = md.render(markdown)
  end

end
