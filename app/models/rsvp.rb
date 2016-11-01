require 'csv'

class Rsvp < ApplicationRecord
  attr_accessor :no_of_guests
  belongs_to :event

  validates :name, presence: { message: "must be present" }
  validates :email,
    presence: { message: "must be present" },
    format: {
      with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
      message: "address must be valid"
    },
    uniqueness: { scope: :event, message: "has already RSVPed"}
  validate :guests_cannot_be_blank

  def guests_cannot_be_blank
    errors.add :guests, "can't be blank" if guests.select(&:blank?).size > 0
  end

  def waitlisted
    index = event.rsvps.sort_by(&:created_at).find_index self
    index + 1 > event.capacity
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |rsvp|
        attrs = rsvp.attributes
        attrs["guests"] = attrs["guests"].join ', '
        csv << attrs.values
      end
    end
  end
end
