require 'net/http'
module Constellation
  class HttpException < StandardError
  end
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
    req.body = { rsvp: rsvp_params.merge(total_count: true) }.to_json
    response = http.request(req)
    raise Constellation::HttpException, response.body unless response.code == '201'
    return JSON.parse(response.body), response['X-Total-Count'].to_i
  rescue *HTTP_ERRORS => e
    raise Constellation::HttpException, e.message
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
