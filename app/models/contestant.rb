# == Schema Information
#
# Table name: contestants
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  state      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contestant < ActiveRecord::Base
  attr_accessible :game_id, :state, :user_id
  
  validates :game_id, :presence => true
  validates :user_id, :presence => true
  
  belongs_to :game
  belongs_to :user
  # belongs_to :candidate
  # has_many :candidates
  # has_many :ballots
  # has_many :tickets, :dependent => :destroy
  has_many :cards, :dependent => :destroy
  
  has_one :current_round, :source => 'rounds', :class_name => 'Round', :through => :game, :conditions => 'state = 0'
  # has_one :active_card, :class_name => 'Card', :conditions => 'state = 0'
  
  # def current_round_count
    # return game.rounds.count
  # end
#    
  # def game_owner
   # self.game.owner.name
  # end
  
  # def previous_round_score
  # #TODO: 2 instances of code Duplicated Code (previous round in game and score)
    # score = 0
    # previous_round = self.game.rounds.where('state = 1').order('id desc').first
    # if previous_round.nil?
      # return -1
    # end
    # previous_round.tickets.each do |ticket|
      # candidates = ticket.winner
        # if(!candidates.nil?)
          # candidates.each do |cand| 
            # score = score+1 unless cand.card.contestant_id != self.id
          # end
        # end
    # end
    # return score
  # end
    
  # def score
    # score = 0
    # self.game.rounds.each do |round|
      # if(round.vote_status == 0)
        # next
      # end
      # round.tickets.each do |ticket|
        # candidates = ticket.winner
        # if(!candidates.nil?)
          # candidates.each do |cand| 
            # score = score+1 unless cand.card.contestant_id != self.id
          # end
        # end
      # end
    # end
    # return score
  # end
  
  
  
  # def setup_for_round(round_id)
     # round = Round.find(round_id)
     # game = Game.find(round.game_id)
     # #Create the Cards
     # @card = Card.new({"round_id"=>round_id, "contestant_id"=>self.id, "state"=> 0, "card_status"=> 0, "vote_status" => 0})
     # @card.save
     # game.contestants.each do |candidate_player|
       # @candidate = Candidate.new({"contestant_id"=>candidate_player.id, "card_id"=>@card.id})
       # @candidate.save
     # end
     # #Create the tickets
     # @ticket = Ticket.new({"round_id"=>round_id, "contestant_id"=>self.id, "state" => 0})
     # @ticket.save  
   # end
   
end
