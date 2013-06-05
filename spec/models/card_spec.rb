# == Schema Information
#
# Table name: cards
#
#  id            :integer          not null, primary key
#  round_id      :integer
#  contestant_id :integer
#  state         :integer          default(0)
#  card_state    :integer          default(0)
#  vote_state    :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe Card do

  before {@card = FactoryGirl.build(:card)}
  
  subject {@card}
  
  it {should respond_to(:contestant_id)}
  it {should respond_to(:round_id)}
  it {should respond_to(:state)}
  it {should respond_to(:card_state)}
  it {should respond_to(:vote_state)}
  
  it {should be_valid}
  
  describe 'when contestant id is not present' do
    before {@card.contestant_id = nil}
    it {should_not be_valid}
  end
  
  describe 'when round id is not present' do
    before {@card.round_id = nil}
    it {should_not be_valid}
  end
  
  describe 'correct default values' do
    its(:state) {should be(0)}
    its(:vote_state) {should be(0)}
    its(:card_state) {should be(0)}
  end

end
