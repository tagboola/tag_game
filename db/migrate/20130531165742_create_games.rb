class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :owner_id
      t.integer :rounds

      t.timestamps
    end
  end
end
