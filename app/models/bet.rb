class Bet < ActiveRecord::Base	
  has_many :memberships, dependent: :destroy

  has_many :members, through: :memberships, source: :user
#
  has_many :agree_members,   -> { where(memberships: { accepted: true }).where(memberships: { against: false }) }, through: :memberships, source: :user
  has_many :against_members, -> { where(memberships: { accepted: true }).where(memberships: { against: true }) },  through: :memberships, source: :user
#
  has_many :agree_requesters,   -> { where(memberships: { accepted: false }).where(memberships: { against: false }) }, through: :memberships, source: :user
  has_many :against_requesters, -> { where(memberships: { accepted: false }).where(memberships: { against: true }) },  through: :memberships, source: :user

  def members
    agree_members | against_members
  end
#
  def requests
    agree_requesters | against_requesters
  end




  has_many :rounds

  #has_many :agree_won_rounds
  #has_many :against_won_rounds




end
