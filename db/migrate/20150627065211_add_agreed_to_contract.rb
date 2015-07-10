class AddAgreedToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :agreed, :boolean
  end
end
