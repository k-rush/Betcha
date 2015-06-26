class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User" # so rails knows the foreign key is user_id (can't infer from :friend)
  validates :friend, uniqueness: { scope: [:user, :friend] } #can still make a second friendship including same people (if active friendship, can make passive friendship and vice versa)

end
