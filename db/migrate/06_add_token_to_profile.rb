class AddTokenToProfile < ActiveRecord::Migration
    def self.up
      add_column :profiles, :token, :string
      add_column :profiles, :token_created_at, :datetime
    end

    def self.down
      remove_column :profiles, :token
      remove_column :profiles, :token_created_at, :datetime
    end
end