class Game < ActiveRecord::Base
  attr_accessible :name, :owner_id, :rounds
  
  validates :name,  :presence => true
  validates :rounds, :presence => true
  validates :owner_id, :presence => true
  
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  

  
end
