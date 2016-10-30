require 'csv'

class Rsvp < ApplicationRecord
  attr_accessor :no_of_guests
  belongs_to :event

  validates :name, presence: { message: "must be present" }
  validates :email,
    presence: { message: "must be present" },
    format: { with: /@/, message: "address must be valid"},
    uniqueness: { message: "has already RSVPed"}

  after_create :check_waitlisted

  def check_waitlisted
    if event.rsvp_count > event.capacity
      update_attribute :waitlisted, true
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |rsvp|
        csv << rsvp.attributes.values
      end
    end
  end
end
