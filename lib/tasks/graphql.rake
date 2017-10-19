namespace :graphql do
  directory "data"

  task :dump_schema => [:environment, "data"] do
    require "graphql/client"
    require "graphql/client/http"
    HTTP = GraphQL::Client::HTTP.new("#{RsvpRails.config[:constellation_url]}/api/graphql/") do
      def headers(_)
        { 'Authorization' => "Bearer #{RsvpRails.config[:constellation_jwt_token]}" }
      end
    end
    Schema = GraphQL::Client.load_schema(HTTP)
    File.open("data/schema.graphql", "w") do |f|
      f.write(Schema.to_definition)
    end
  end
end