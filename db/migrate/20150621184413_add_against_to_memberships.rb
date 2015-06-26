class AddAgainstToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :against, :boolean
  end
end
