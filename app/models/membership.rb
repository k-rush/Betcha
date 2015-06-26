class Membership < ActiveRecord::Base
  belongs_to :bet
  belongs_to :user
  validates :bet, uniqueness: { scope: :user }
end
