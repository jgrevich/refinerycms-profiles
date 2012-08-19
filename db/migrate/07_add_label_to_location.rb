class AddLabelToLocation < ActiveRecord::Migration
    def self.up
      add_column :profile_locations, :label, :string
      add_column :profile_locations, :primary, :boolean
    end

    def self.down
      remove_column :profile_locations, :label, :string
      remove_column :profile_locations, :primary, :boolean
    end
end