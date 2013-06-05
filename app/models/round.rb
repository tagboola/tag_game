# == Schema Information
#
# Table name: rounds
#
#  id         :integer          not null, primary key
#  state      :integer          default(0)
#  category   :string(255)
#  game_id    :integer
#  card_state :integer          default(0)
#  vote_state :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Round < ActiveRecord::Base
  attr_accessible :card_state, :category, :game_id, :state, :vote_state
  
  #Validations
  validates :game_id, :presence => true
  
  #Callbacks
  # before_create :check_for_current, :message=>"There can only be 1 current round per game"
  # after_save :round_closed?
  
  #Associations
  belongs_to :game
  # has_many :tickets, :dependent => :destroy
  has_many :cards, :dependent => :destroy
  # has_many :candidates, :through => :cards
  # has_many :ballots, :through => :tickets
  
  # def check_for_current
    # @game = Game.find(self.game_id)
    # if (@game.rounds.find_by_state(0))
      # errors.add(:base, "There can only be 1 current round per game")
      # return false
    # else
      # self.state = 0 unless self.state
    # end
  # end
  
  # def round_closed?
    # if(state == 1)
      # self.cards.each do |c|
        # c.state = 1;
        # c.save
      # end
      # self.tickets.each do |t|
        # t.state = 1;
        # t.save
      # end
    # end
  # end
  
end
