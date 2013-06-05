require 'spec_helper'

describe "Cards" do
  describe "Unauthorized Card requests" do
  
    it "should redirect GET /cards" do
      get "/cards"
      response.status.should be(302)
    end
    
    it "should not GET /cards.json" do
      get "/cards.json"
      response.status.should be(401)
    end
  end
end
