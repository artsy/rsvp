class Event < ApplicationRecord
  has_many :rsvps

  def rsvp_count
    rsvps.count
  end
end
