class ChangeBetItToBetIdInMemberships < ActiveRecord::Migration
  def change
    rename_column :memberships, :bet_it, :bet_id
  end
end
