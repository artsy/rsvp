class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :description, length: { maximum: 2000 }
end
