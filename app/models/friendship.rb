class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User" # so rails knows the foreign key is user_id (can't infer from :friend)
end
