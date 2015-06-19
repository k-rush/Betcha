class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
    	t.text :bet
    	t.text :title
    	t.integer :wager
    	t.integer :odds
    	t.references :user
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
