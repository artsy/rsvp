require "graphql/client"
require "graphql/client/http"
module Constellation
  class GraphQLException < StandardError
  end
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

  HTTP = GraphQL::Client::HTTP.new("#{RsvpRails.config[:constellation_url]}/api/graphql/") do
    def headers(_)
      { 'Authorization' => "Bearer #{RsvpRails.config[:constellation_jwt_token]}" }
    end
  end
  Schema = GraphQL::Client.load_schema(HTTP)
  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

  CreateRsvpMutation = Client.parse <<-GRAPHQL
    mutation($input: createRsvpInput!) {
      createRsvp(input: $input) {
        id
        total_count
      }
    }
  GRAPHQL

  def self.create_rsvp!(rsvp_params)
    rsvp_params[:event_id] = rsvp_params[:event_id].to_s
    response = Client.query(CreateRsvpMutation, variables: { input: rsvp_params.to_h })
    response = response.to_h

    if response['errors'] && response['errors'].any?
      message = response['errors'].map { |e| e['message'] }.join(', ')
      raise Constellation::GraphQLException, message
    end

    return response['data'], response['data']['createRsvp']['total_count']
  rescue *HTTP_ERRORS => e
    raise Constellation::HttpException, e.message
  end
end
