class ConstellationHttpException < StandardError
end

require 'net/http'
module Constellation
  HTTP_ERRORS = [
    Errno::ETIMEDOUT,
    Timeout::Error,
    Net::OpenTimeout,
    Net::ReadTimeout,
    EOFError,
    Errno::ECONNABORTED,
    Errno::ECONNREFUSED,
    Errno::ECONNRESET,
    Errno::EHOSTDOWN,
    Errno::EHOSTUNREACH,
    Errno::EINVAL,
    Errno::ENETUNREACH,
    SocketError,
    OpenSSL::SSL::SSLError,
    Net::HTTPBadResponse,
    Net::HTTPHeaderSyntaxError,
    Net::ProtocolError,
    Zlib::GzipFile::Error,
  ]

  def self.create_rsvp!(rsvp_params)
    return unless constellation_enabled?
    uri = URI.parse("#{app}/rsvps")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.path, headers)
    req.body = { rsvp: rsvp_params }.to_json
    response = http.request(req)
    raise ConstellationHttpException, response.body unless response.code == '201'
    JSON.parse(response.body)
  rescue *HTTP_ERRORS => e
    raise ConstellationHttpException, e.message
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
