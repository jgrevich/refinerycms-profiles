module Refinery
  class ProfilesGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_profiles:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
    end
    
  end
end
