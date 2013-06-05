# == Schema Information
#
# Table name: cards
#
#  id            :integer          not null, primary key
#  round_id      :integer
#  contestant_id :integer
#  state         :integer          default(0)
#  card_state    :integer          default(0)
#  vote_state    :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Card < ActiveRecord::Base
  attr_accessible :card_state, :round_id, :state, :vote_state, :contestant_id
  
  validates :round_id, presence: true
  validates :contestant_id, presence: true 
  
  belongs_to :contestant
  belongs_to :round
  #has_many :candidates, :dependent => :destroy
  
  # def locked
    # return ( ((Time.now - self.created_at) > self.round.game.card_timer) || (self.state == 1) )
  # end
#   
  # def candidates_filled?
    # return self.candidates.where("value IS NULL").length == 0
  # end
  
end
