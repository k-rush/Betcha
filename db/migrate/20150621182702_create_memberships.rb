class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :bet_it
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end
