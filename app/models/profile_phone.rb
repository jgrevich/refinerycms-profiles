class ProfilePhone < ActiveRecord::Base

  belongs_to :phonable, :polymorphic => true
  validates :number, :presence => true, :uniqueness => true
  
  def to_s
    self.number
  end
  
end
