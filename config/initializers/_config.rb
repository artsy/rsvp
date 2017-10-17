module RsvpRails
  mattr_accessor :config
end

unless Rails.env.test?
  fail("Missing CONSTELLATION_URL ENV value") unless ENV['CONSTELLATION_URL']
  fail("Missing CONSTELLATION_JWT_TOKEN ENV value") unless ENV['CONSTELLATION_JWT_TOKEN']
end

RsvpRails.config = {
  constellation_jwt_token: ENV['CONSTELLATION_JWT_TOKEN'],
  constellation_url: ENV['CONSTELLATION_URL']
}.with_indifferent_access
