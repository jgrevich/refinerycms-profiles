module ProfilesHelper
  
  def phormat(number)
    if number
      n = number.to_s
      "#{n[0..2]}.#{n[3..5]}.#{n[6..9]}"
    else
      ''
    end
  end
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render('admin/profiles/' + association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, '#{association}', '#{escape_javascript(fields)}')"))
  end
  
  def add_affiliation
    Rails.logger.error 'add affil'
    link_to_function('hi', "alert('hi')")
  end
  
  def add_organization
    fields = fields_for :organization, Organization.new, :child_index => "new_organization" do |builder|
      render('admin/profiles/' + "organization_fields", :f => builder)
    end

   link_to_function('add organization', ("add_fields(this, 'Organization', '#{escape_javascript(fields)}')"))    
  end
end