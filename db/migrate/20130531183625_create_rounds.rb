class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :state, :default => 0
      t.string :category
      t.integer :game_id
      t.integer :card_state, :default => 0
      t.integer :vote_state, :default => 0

      t.timestamps
    end
  end
end
