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
  
  it {should be_valid}
  
  describe "when name is not present" do
    before {@user.email = ""}
    it {should_not be_valid}
  end
  
  describe "when password is not present" do
    before {@user.password = ""}
    it {should_not be_valid}
  end

end
