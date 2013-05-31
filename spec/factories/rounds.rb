# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :round do
    state 1
    category "MyString"
    association :game, factory: :game
    card_state 1
    vote_state 1
  end
end
