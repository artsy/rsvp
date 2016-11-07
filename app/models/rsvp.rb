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

  before_validation :strip_email

  def strip_email
    email.strip!
  end

  def guests_cannot_be_blank
    errors.add :guests, "can't be blank" if guests.select(&:blank?).size > 0
  end

  def waitlisted
    index = event.rsvps.sort_by(&:created_at).find_index self
    leading_rsvps = event.rsvps[0...index]
    return false unless leading_rsvps.size > 0
    total_leading_guests = leading_rsvps
      .map { |r| r.guests.size + 1 }
      .reduce { |a,b| a + b }
    total_leading_guests + self.guests.size + 1 > event.capacity
  end

  def self.to_csv(options = {})

    CSV.generate(options) do |csv|
      csv << [
        "id",
        "email",
        "created at",
        "guests",
        "waitlisted",
        "first name",
        "last name"
      ]
      all.each do |rsvp|
        cols = rsvp.attributes.slice("id", "email", "created_at").values
        cols << rsvp.attributes["guests"].join(', ')
        cols << (rsvp.waitlisted ? "Yes" : " ")
        cols << rsvp.attributes["name"].split(' ')[0]
        cols << rsvp.attributes["name"].split(' ')[1]
        csv << cols
      end
    end
  end
end
