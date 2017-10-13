module RsvpRails
  mattr_accessor :config
end

fail("Missing CONSTELLATION_URL ENV value") unless ENV['CONSTELLATION_URL']
fail("Missing CONSTELLATION_JWT_TOKEN ENV value") unless ENV['CONSTELLATION_JWT_TOKEN']

RsvpRails.config = {
  constellation_jwt_token: ENV['CONSTELLATION_JWT_TOKEN'],
  constellation_url: ENV['CONSTELLATION_URL']
}.with_indifferent_access
