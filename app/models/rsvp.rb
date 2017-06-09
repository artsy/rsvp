class Rsvp
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :no_of_guests, :name, :email

  def initialize(options = {})
    @name = options[:name]
    @email = options[:email]
    @no_of_guests = options[:no_of_guests]
  end

  def persisted?
    false
  end
end
