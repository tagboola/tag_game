require 'spec_helper'
include Warden::Test::Helpers

describe "Rounds" do
  
  describe "Unauthorized Round requests" do
    
    it "should redirect GET /rounds" do
      get "/rounds"
      response.status.should be(302)
    end 
    
    it "should not GET /rounds.json" do
      get "/rounds.json"
      response.status.should be(401)  
    end
    
  end
  
  # describe "Authorized Game Requests" do
#     
    # before :each do
      # user = FactoryGirl.create(:user)
      # login_as user, scope: :user  
    # end
#     
    # it "should GET /rounds" do
      # get "/rounds"
      # response.status.should be(200)
    # end
#     
    # it "should GET /rounds" do
      # get "/rounds.json"
      # response.status.should be(200)
    # end
#     
  # end

end
