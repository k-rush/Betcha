class MembershipAcceptedDefaultValue < ActiveRecord::Migration

  def down
    remove_column :memberships, :accepted
  end

  
end