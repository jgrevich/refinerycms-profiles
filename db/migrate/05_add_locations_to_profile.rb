class AddLocationsToProfile < ActiveRecord::Migration
	def self.up

    create_table :profile_locations do |t|
      t.string :building_name
      t.string :building_acronym
      t.integer :mail_code
      t.string :room_number
      
      t.integer :position
      t.references :locatable, :polymorphic => true

      t.timestamps
    end

    add_index :profile_locations, :id


	end

	def self.down
	  drop_table :profile_locations
	end
end