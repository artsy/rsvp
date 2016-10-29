class Rsvp < ApplicationRecord
  belongs_to :event

  validates :name, presence: { message: "must be present" }
  validates :email,
    presence: { message: "must be present" },
    format: { with: /@/, message: "address must be valid"},
    uniqueness: { message: "has already RSVPed"}
end
