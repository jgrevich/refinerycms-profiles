class ProfileEmail < ActiveRecord::Base

  belongs_to :emailable, :polymorphic => true
  validates :content, :presence => true, :uniqueness => true
  
  def to_s
    self.content
  end
end
