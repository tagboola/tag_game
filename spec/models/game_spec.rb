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

require 'spec_helper'

describe Game do

  before {@game = FactoryGirl.build(:game)}
  
  subject {@game}
  
  it {should respond_to(:name)}
  it {should respond_to(:owner_id)}
  it {should respond_to(:num_rounds)}
  
  it {should respond_to(:owner)}
  
  it {should be_valid}
  
  describe "when name is not present" do
    before {@game.name = ""}
    it {should_not be_valid}
  end
  
  describe "when owner id is not present" do
    before {@game.owner_id = nil}
    it {should_not be_valid}
  end
  
  describe "when number of rounds is not present" do
    before {@game.num_rounds = nil}
    it {should_not be_valid}
  end
  
  describe "should have the correct" do
    let(:user) {User.find(@game.owner_id)}
    its(:owner) {should == user}
  end
  
  describe "should have the correct" do
    let(:round) {@game.rounds.new(category: 'test', game_id: @game.id)}
    its(:rounds) {should == [round]}
  end
  
  describe "should have the correct" do
    let(:contestant) {@game.contestants.new(user_id: 1)}
    its(:contestants) {should == [contestant]} 
  end
  
  describe 'deleting a game' do
    before do
      @game.save
      @round = FactoryGirl.create(:round, :game_id => @game.id)
      @contestant = FactoryGirl.create(:contestant, :game_id => @game.id)
      @game.destroy
    end
    it 'should destroy the round' do
      expect { @round.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
    it 'should destroy the contestant' do
      expect { @contestant.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  

end
