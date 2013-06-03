# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  owner_id   :integer
#  num_rounds :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :name, :owner_id, :num_rounds
  
  validates :name,  :presence => true
  validates :num_rounds, :presence => true
  validates :owner_id, :presence => true
  
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  has_many :rounds, :dependent => :destroy
  has_many :contestants, :dependent => :destroy
  
  # has_one :game_apn_group
  # has_one :apn_group, :through => :game_apn_group
  
  # def current_round
    # return self.rounds.find_by_state(0)
  # end

  # def previous_round
    # return self.rounds.where('state = 1').order('id desc').first
  # end
  
end
