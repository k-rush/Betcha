class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :round
  validates :user, uniqueness: { scope: [:user, :round] } 
end
