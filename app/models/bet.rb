class Bet < ActiveRecord::Base
	belongs_to :user # user who created it

  has_many :memberships

  has_many :agree_members,   -> { where(membership: { accepted: true, against: false }) }, through: :memberships, source: :user
  has_many :against_members, -> { where(membership: { accepted: true, against: true }) },  through: :memberships, source: :user

  has_many :membership_requests, -> { where(membership: { accepted: false }) }, through: :memberships, source: :user

end
