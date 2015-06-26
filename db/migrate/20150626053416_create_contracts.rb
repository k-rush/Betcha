class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :round_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
