class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :round_id
      t.integer :contestant_id
      t.integer :state, :default => 0
      t.integer :card_state, :default => 0
      t.integer :vote_state, :default => 0

      t.timestamps
    end
  end
end
