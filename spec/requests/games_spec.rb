require 'spec_helper'
include Warden::Test::Helpers

describe "Games" do
  
  describe "Unauthorized Game Requests" do
  
    it "should redirect GET /games" do
      get "/games"
      response.status.should be(302)
    end
    
    it "should not GET /games.json" do
      get "/games.json"
      response.status.should be(401)  
    end
      
  end
  
  # describe "Authorized Game Requests" do
    # before :each do
      # user = FactoryGirl.create(:user)
      # login_as user, scope: :user  
    # end
#     
    # it "should GET /games" do
      # get "/games"
      # response.status.should be(200)
    # end
#     
    # it "should GET /games.json" do
      # get "/games.json"
      # response.status.should be(200)
    # end
#       
  # end
#   
  
end
