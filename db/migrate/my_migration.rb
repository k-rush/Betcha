class MembershipAcceptedDefaultValue < ActiveRecord::Migration

  def up
    add_column :memberships, :accepted, :boolean, default: false
  end

end
