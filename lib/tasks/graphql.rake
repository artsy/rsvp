namespace :graphql do
  directory "data"

  desc "Dump Constellation schema for Visual Studio Code integration."
  task :dump_schema => [:environment, "data"] do
    File.open('data/schema.graphql', "w") do |f|
      f.write(Constellation.client.schema.to_definition)
      puts "Written #{f.size} byte(s) to #{f.path}."
    end
  end
end
