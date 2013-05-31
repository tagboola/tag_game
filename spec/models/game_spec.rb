require 'spec_helper'

describe Game do

  before {@game = FactoryGirl.build(:game)}
  
  subject {@game}
  
  it {should respond_to(:owner_id)}
  it {should respond_to(:rounds)}
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
    before {@game.rounds = nil}
    it {should_not be_valid}
  end
  
  describe "should have the correct owner" do
    let(:user) {User.find(@game.owner_id)}
    its(:owner) {should == user}
  end
  

end
