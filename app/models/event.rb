class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  has_many :rsvps

  def rsvp_count
    rsvps.count + rsvps.inject(0) { |n, rsvp| rsvp.guests.length + n }
  end

  def is_over_capacity
    rsvp_count > capacity
  end
end
