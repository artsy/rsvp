class ConstellationHttpException < StandardError
end

require 'net/http'
module Constellation
  def self.create_rsvp!(rsvp_params)
    return unless constellation_enabled?
    uri = URI.parse("#{app}/rsvps")
    http = Net::HTTP.new(uri.host, uri.port)
    unless Rails.env.development?
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    req = Net::HTTP::Post.new(uri.path, headers)
    req.body = { rsvp: rsvp_params }.to_json
    response = http.request(req)
    raise ConstellationHttpException, response.body unless response.code == '201'
    JSON.parse(response.body)
  end

  def self.constellation_enabled?
    app && token
  end

  def self.app
    RsvpRails.config[:constellation_url]
  end

  def self.token
    RsvpRails.config[:jwt_token]
  end

  def self.headers
    {
      'Authorization' => token,
      'Content-type' => 'application/json'
    }
  end
end
