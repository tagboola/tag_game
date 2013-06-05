require 'spec_helper'
include Warden::Test::Helpers

describe "Users" do
  
  describe 'Logging In' do
    
    before :each do
      @user = FactoryGirl.create(:login_user)
      @attr = {:user => {:email => "user@example.com", :password => "password"}}
    end
    
    it "should log in correctly and return authentication_token" do
      post "/users/sign_in.json", @attr
      response.status.should be(200) 
      response.body.should have_content("authentication_token")
    end
    
    it "shouldn't log in correctly" do
      post "/users/sign_in.json", {:user => {:email => "user@example.com", :password => "wrong_password"}}
      response.status.should be(401)
      response.body.should == '{"error" : "unauthorized"}'
    end
    
    it "shouldn't log in correctly" do
      post "/users/sign_in.json", {:user => {:email => "wrong_username", :password => "wrong_password"}}
      response.status.should be(401)
      response.body.should == '{"error" : "unauthorized"}'
    end
    
    #TODO: Test view-based signing in as well
    # it "should log in correctly" do
      # visit "/users/sign_in"
      # fill_in "Email", :with => @user.email
      # fill_in "Password", :with => @user.password
      # click_button "Sign in"
      # page.should have_content("Signed in successfully.")
    # end
  
  end
  
  describe 'Registering' do
    
    before :all do
      @attr = {:user => {:email => "user@example.com", :password => "password"}}
    end
    
    it 'should register correctly' do
      post "/users.json", @attr
      response.status.should be(200)
      response.body.should have_content("user")
      response.body.should have_content("authentication_token")
    end
    
    it 'should not register correctly with duplicate emails' do
      FactoryGirl.create(:login_user)
      post "/users.json", @attr
      response.status.should be(200)
      response.body.should have_content('"success":false')
    end
    
    #TODO: Test view-based signing in as well
    # # it "should register correctly" do
      # # visit "/users/sign_up"
      # # # fill_in "First name", :with => @user.first_name
      # # # fill_in "Last name", :with => @user.first_name
      # # fill_in "Email", :with => @user.email
      # # fill_in "Password", :with => @user.password
      # # fill_in "Password confirmation", :with => @user.password
      # # page.should have_content("Welcome! You have signed up successfully.")
    # # end
    
  end
  
  describe "Unauthorized User Requests" do
    
    it "should redirect on GET /users" do
      get "/users"
      response.status.should be(302)
    end
    
    it "should return a 401 on GET /users" do
      get "/users.json", :format => :json
      response.status.should be(401)
      response.body == '{"error" : "unauthorized"}'
    end
  
  end
  
#   
  # describe "Authorized User Requests" do
# 
    # before :each do
      # user = FactoryGirl.create(:user)
      # login_as user, scope: :user
    # end
# 
    # it "should GET /users" do
      # get "/users"
      # response.status.should be(200)
    # end
#     
    # it "should GET /users.json" do
      # get "/users.json"
      # response.status.should be(200)
    # end
# 
  # end

end
