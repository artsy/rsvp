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
end
