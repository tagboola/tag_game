# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name "Game"
    association :owner, factory: :user
    num_rounds 1
  end
end
