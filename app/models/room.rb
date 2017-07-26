class Room < ApplicationRecord
  has_many :reservations
  belongs_to :location


  validates :name, presence: true, uniqueness: true, null: false, length: {minimum: 3, maximum: 50}
  validates :location, presence: true

  before_save :markdown_to_html

  def markdown_to_html
    renderer = Redcarpet::Render::HTML.new
    md = Redcarpet::Markdown.new(renderer)

    self.html = md.render(markdown)
  end

  def as_json(options={})
    super.as_json(options).merge({:available_days => available_days})
  end

  def available_days
    Time.use_zone(location.timezone) do
      all_days = Time.zone.tomorrow..1.year.from_now
      # TODO: query only for reservations starting today + later.

      reservations = Reservation
      .where(room: self, cancelled: false)
      .where("lower(reservation_duration) >= now()")

      reserved_days = reservations.pluck(:reservation_duration).map{|tsrange| tsrange.first.to_date..tsrange.last.to_date}
      .map(&:to_a)
      .flatten

      days = all_days.to_a - reserved_days
      days.map {|day| day.to_s}
      # all_days.map {|day| day.to_s}
    end
  end

end
