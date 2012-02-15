class CreateProfileCategorizations < ActiveRecord::Migration
  def self.up
    create_table :profile_categorizations do |t|
      t.integer :profile_id
      t.integer :profile_category_id
      
      t.timestamps
    end
    
    add_index :profile_categorizations, :profile_id
    add_index :profile_categorizations, :profile_category_id
  end

  def self.down
    drop_table :profile_categorizations
  end
end