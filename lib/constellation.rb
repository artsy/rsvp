module Constellation
  def self.client
    Graphlient::Client.new(
      "#{RsvpRails.config[:constellation_url]}/api/graphql/",
      headers: {
        'Authorization' => "Bearer #{RsvpRails.config[:constellation_jwt_token]}"
    })
  end

  def self.create_rsvp!(rsvp_params)
    mutation = <<-GRAPHQL
      mutation($input: createRsvpInput!) {
        createRsvp(input: $input) {
          id
          total_count
        }
      }
    GRAPHQL

    variables = { input: rsvp_params.to_h }
    variables[:input][:event_id] = variables[:input][:event_id].to_s

    response = client.execute(mutation, variables)

    return response.data, response.data.create_rsvp.total_count
  end
end
