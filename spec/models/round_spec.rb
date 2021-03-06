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

require 'spec_helper'

describe Round do
  
  before {@round  = FactoryGirl.build(:round)}
  
  subject {@round}
  
  it {should respond_to(:state)}
  it {should respond_to(:category)}
  it {should respond_to(:game_id)}
  it {should respond_to(:card_state)}
  it {should respond_to(:vote_state)}
  
  it {should respond_to(:game)}
  it {should respond_to(:cards)}

  it {should be_valid}
  
  describe 'when game id is not present' do
    before {@round.game_id = nil}
    it {should_not be_valid}  
  end
  
  describe 'should have the correct game' do
    let(:game) {Game.find(@round.game_id)}
    its(:game) {should == game}
  end
  
  describe 'deleting a round' do
    before do
      @round.save
      @card = FactoryGirl.create(:card, round_id: @round.id)
      @round.destroy
    end
    it 'should destroy the card' do
      expect { @card.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
end
