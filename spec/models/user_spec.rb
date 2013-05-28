require 'spec_helper'

describe User do

  before {@user = User.new(email:"user@example.com", password:"password")}
  
  subject {@user}
  
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:remember_me)}
  it {should respond_to(:reset_password_token)}
  it {should respond_to(:reset_password_sent_at)}
  it {should respond_to(:remember_created_at)}
  it {should respond_to(:sign_in_count)}
  it {should respond_to(:current_sign_in_at)}
  it {should respond_to(:last_sign_in_at)}
  it {should respond_to(:current_sign_in_ip)}
  it {should respond_to(:last_sign_in_ip)}
  
  it {should be_valid}
  
  describe "when name is not present" do
    before {@user.email = ""}
    it {should_not be_valid}
  end
  
  describe "when password is not present" do
    before {@user.password = ""}
    it {should_not be_valid}
  end
  
  describe "when sign in count does not default to 0" do
    its(:sign_in_count) {should == 0}
  end
  
  describe "when email is not unique" do
    before do
      dup_user = @user.dup
      dup_user.email = @user.email.upcase
      dup_user.save
    end
    it {should_not be_valid}
  end
  
  describe "when reset password token is not unique" do
    before do
      @user.reset_password_token = "test"
      dup_user = @user.dup
      dup_user.save
    end
    it {should_not be_valid}
  end
   
  

end
