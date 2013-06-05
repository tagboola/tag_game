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

require 'spec_helper'

describe Contestant do
  
  before {@contestant = FactoryGirl.build(:contestant)}
  
  subject {@contestant}
  
  it {should respond_to(:game_id)}
  it {should respond_to(:state)}
  it {should respond_to(:user_id)}
  
  it {should respond_to(:game)}
  it {should respond_to(:user)}
  it {should respond_to(:cards)}
  it {should respond_to(:current_round)}
  
  describe "when game id is not present" do
    before {@contestant.game = nil}
    it {should_not be_valid}
  end
  
  describe "when user id is not present" do
    before {@contestant.user = nil}
    it {should_not be_valid}
  end
  
  describe "current round" do
    it "should get the correct round"
  end
  
  describe 'destroy' do
    before do
      @contestant.save
      @card = FactoryGirl.create(:card, contestant_id: @contestant.id)
      @contestant.destroy
    end
    it 'should destroy the card' do
      expect { @card.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
end
