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
  
end
