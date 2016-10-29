class Event < ApplicationRecord
  friendly_id :name, use: [:slugged, :finders]
  has_many :rsvps

  def rsvp_count
    rsvps.count
  end
end
