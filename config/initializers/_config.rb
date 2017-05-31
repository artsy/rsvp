module RsvpRails
  mattr_accessor :config
end

RsvpRails.config = {
  jwt_token: ENV['JWT_TOKEN'],
  constellation_url: ENV['CONSTELLATION_URL']
}.with_indifferent_access
