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
  
  it {should respond_to(:owner_id)}
  it {should respond_to(:num_rounds)}
  it {should respond_to(:name)}
  
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
  
  describe "when rounds is not present" do
    before {@game.num_rounds = nil}
    it {should_not be_valid}
  end
  
  describe "should have the correct owner" do
    let(:user) {User.find(@game.owner_id)}
    its(:owner) {should == user}
  end
  
  #TODO: Test function
  describe "current round" do
  end
  
  #TODO: Test function
  describe "previous round" do
  end
  

end
