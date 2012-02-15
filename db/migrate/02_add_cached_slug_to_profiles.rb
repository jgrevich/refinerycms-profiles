class AddCachedSlugToProfiles < ActiveRecord::Migration
    def self.up
      add_column :profiles, :cached_slug, :string
    end

    def self.down
      remove_column :profiles, :cached_slug
    end
  end