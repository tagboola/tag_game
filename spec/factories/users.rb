# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  factory :login_user, class: User do
    email 'user@example.com'
    password 'password'
  end
  
  factory :user do
    email
    password 'password'
  end
  
end