# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contestant do
    association :user, factory: :user, email: "user3@example.com"
    game
  end
end
