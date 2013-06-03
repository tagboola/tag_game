require 'spec_helper'

describe Contestant do
  
  before {@contestant = FactoryGirl.build(:contestant)}
  
  subject {@contestant}
  
  it {should respond_to(:game_id)}
  it {should respond_to(:state)}
  it {should respond_to(:user_id)}
  
  it {should respond_to(:game_id)}
  it {should respond_to(:user_id)}
  it {should respond_to(:current_round)}
  
  describe "when game_id is not present" do
    before {@contestant.game = nil}
    it {should_not be_valid}
  end
  
  describe "when user_id is not present" do
    before {@contestant.user = nil}
    it {should_not be_valid}
  end
  
  describe "deleting a user" do
    before do
      @contestant.save
      @contestant.user.destroy
    end
    it 'should destroy the contestant' do
      expect {@contestant.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  describe "deleting a game" do
    before do
      @contestant.save
      @contestant.game.destroy
    end
    it "should destroy the contestant" do
      expect {@contestant.reload}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  
  
end
