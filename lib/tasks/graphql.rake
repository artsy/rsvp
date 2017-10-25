namespace :graphql do
  directory "data"

  task :dump_schema => [:environment, "data"] do
    client = Graphlient::Client.new(
      "#{RsvpRails.config[:constellation_url]}/api/graphql/", 
      headers: { 
        'Authorization' => "Bearer #{RsvpRails.config[:constellation_jwt_token]}" 
    })
    File.open('data/schema.graphql', "w") do |f|
      f.write(client.schema.to_definition)
      puts "Written #{f.size} byte(s) to #{f.path}."
    end
  end
end