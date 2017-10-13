require "graphql/client"
require "graphql/client/http"
module Constellation
  class GraphQLException < StandardError
  end

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

    raise Constellation::GraphQLException, response.errors["data"] unless response.data
    response
  end
end
