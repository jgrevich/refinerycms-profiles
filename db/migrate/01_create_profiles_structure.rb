class CreateProfilesStructure < ActiveRecord::Migration

  def self.up
    create_table :profiles do |t|
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.text :bio
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

    add_index :profiles, :id

    load(Rails.root.join('db', 'seeds', 'profiles.rb'))

    create_table :profile_emails do |t|
      t.string :content
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :emailable, :polymorphic => true
      
      t.timestamps
    end

    add_index :profile_emails, :id
    
    create_table :profile_phones do |t|
      t.string :number
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :phonable, :polymorphic => true

      t.timestamps
    end

    add_index :profile_phones, :id

    create_table :profile_urls do |t|
      t.string :content
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :urlable, :polymorphic => true

      t.timestamps
    end

    add_index :profile_urls, :id
    
    create_table :profile_affiliations do |t|
      t.integer :department_id
      t.integer :organization_id
      t.integer :profile_id
      t.integer :title_id
      t.date :start
      t.date :end
      t.integer :position

      t.timestamps
    end

    add_index :profile_affiliations, :id
    add_index :profile_affiliations, :department_id
    add_index :profile_affiliations, :profile_id
    add_index :profile_affiliations, :title_id
  
    create_table :profile_titles do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :profile_titles, :id
  
    create_table :departments_titles, :id => false do |t|
      t.integer :profile_department_id
      t.integer :profile_title_id
    end
    
    create_table :profile_departments do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :profile_departments, :id

    create_table :departments_organizations, :id => false do |t|
      t.integer :profile_department_id
      t.integer :profile_organization_id
    end
  
    create_table :profile_organizations do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :profile_organizations, :id
  end


  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "profiles"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/profiles"})
    end

    drop_table :profiles
    drop_table :profile_emails
    drop_table :profile_phones
    drop_table :profile_urls
    drop_table :profile_affiliations
    drop_table :profile_titles
    drop_table :departments_titles
    drop_table :profile_departments
    drop_table :departments_organizations
    drop_table :profile_organizations
  end

end
