require 'spec_helper'

describe "Contestants" do

  describe "Unauthorized Contestants requests" do
    
    it "should redirect GET /contestants" do
      get "/contestants"
      response.status.should be(302)
    end 
    
    it "should not GET /contestants.json" do
      get "/contestants.json"
      response.status.should be(401)  
    end
  end
end
