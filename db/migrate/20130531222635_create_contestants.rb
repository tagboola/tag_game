class CreateContestants < ActiveRecord::Migration
  def change
    create_table :contestants do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :state, :default => 0

      t.timestamps
    end
  end
end
