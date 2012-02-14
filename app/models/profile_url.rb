class ProfileUrl < ActiveRecord::Base

  belongs_to :urlable, :polymorphic => true
  validates :content, :presence => true, :uniqueness => true
  
  def to_s
    self.content
  end
end
