class CreateProfilesStructure < ActiveRecord::Migration


  def self.up

    ## profiles
    create_table Refinery::Profiles::Profile.table_name, :id => true do |t|
      t.string :prefix
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.text :bio
      t.integer :photo_id
      t.string :slug
      t.integer :position
      t.timestamps
    end
  
    add_index Refinery::Profiles::Profile.table_name, :id

    ## affiliations
    create_table Refinery::Profiles::Affiliation.table_name, :id => true do |t|
      t.integer :department_id
      t.integer :organization_id
      t.integer :profile_id
      t.integer :title_id
      t.string :token
      t.datetime :token_created_at
      t.date :start
      t.date :end
      t.integer :position

      t.timestamps
    end
    
    add_index Refinery::Profiles::Affiliation.table_name, [:id, :department_id, :profile_id, :title_id], :name => "index_refinery_profiles_affiliations_on_id_did_pid_and_id"

    ## categories
    create_table Refinery::Profiles::Category.table_name, :id => true do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
    
    add_index Refinery::Profiles::Category.table_name, :id
    
    create_table Refinery::Profiles::Categorization.table_name, :id => true do |t|
      t.integer :category_id
      t.integer :profile_id
    end
    
    add_index Refinery::Profiles::Categorization.table_name, [:id, :category_id, :profile_id ], :name => 'index_refinery_profiles_categorizations_on_id_cid_and_pid'
    
    ## departments
    create_table Refinery::Profiles::Department.table_name, :id => true do |t|
      t.string :name
      t.integer :position
      t.string :label
      t.boolean :primary

      t.timestamps
    end

    add_index Refinery::Profiles::Department.table_name, :id

    create_table :refinery_profiles_departments_organizations, :id => false do |t|
      t.integer :department_id
      t.integer :organization_id
    end

    add_index :refinery_profiles_departments_organizations, [:department_id, :organization_id], :name => 'index_refinery_profiles_departments_organizations_on_did_and_oid'

    create_table :refinery_profiles_departments_titles, :id => false do |t|
      t.integer :department_id
      t.integer :title_id
    end

    add_index :refinery_profiles_departments_titles, [:department_id, :title_id], :name => 'index_refinery_profiles_departments_titles_on_did_and_tid'

    ## emails
    create_table Refinery::Profiles::Email.table_name, :id => true do |t|
      t.string :content
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :emailable, :polymorphic => true
      
      t.timestamps
    end

    add_index Refinery::Profiles::Email.table_name, :id

    ## organizations
    create_table Refinery::Profiles::Location.table_name, :id => true do |t|
      t.string :building_name
      t.string :building_acronym
      t.integer :mail_code
      t.string :room_number
      
      t.integer :position
      t.references :locatable, :polymorphic => true

      t.timestamps
    end
    
    add_index Refinery::Profiles::Location.table_name, :id

    ## organizations
    create_table Refinery::Profiles::Organization.table_name, :id => true do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
    
    add_index Refinery::Profiles::Organization.table_name, :id

    ## phones
    create_table Refinery::Profiles::Phone.table_name, :id => true do |t|
      t.string :number
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :phonable, :polymorphic => true

      t.timestamps
    end
    
    add_index Refinery::Profiles::Phone.table_name, :id
    
    ## titles
    create_table Refinery::Profiles::Title.table_name, :id => true do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
    
    add_index Refinery::Profiles::Title.table_name, :id
    
    ## URLs
    create_table Refinery::Profiles::Url.table_name, :id => true do |t|
      t.string :content
      t.string :label
      t.boolean :primary
      t.integer :position
      t.references :urlable, :polymorphic => true

      t.timestamps
    end
    
    add_index Refinery::Profiles::Url.table_name, :id
    
  end


  def self.down
    Refinery::UserPlugin.destroy_all({:name => "refinerycms_profiles"})
    Refinery::Page.delete_all({:link_url => "/profiles"})

    drop_table Refinery::Profiles::Profile.table_name
    drop_table Refinery::Profiles::Affiliation.table_name
    drop_table Refinery::Profiles::Department.table_name
    drop_table Refinery::Profiles::Email.table_name
    drop_table Refinery::Profiles::Phone.table_name
    drop_table Refinery::Profiles::Location.table_name
    drop_table Refinery::Profiles::Organization.table_name
    drop_table Refinery::Profiles::Title.table_name
    drop_table Refinery::Profiles::Url.table_name
    drop_table :refinery_profiles_departments_organizations
    drop_table :refinery_profiles_departments_titles
  end

end