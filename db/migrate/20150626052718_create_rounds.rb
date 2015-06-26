class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :pot
      t.integer :bet_id
      t.integer :odds
      t.boolean :signed
      t.boolean :agree_won

      t.timestamps null: false
    end
  end
end
