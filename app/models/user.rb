class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

# FRIENDS (and friendships)
  has_many :friendships
  has_many :passive_friendships,  class_name: "Friendship",
                                  foreign_key: "friend_id" 
  # friends are either active (you sent then friend request and they accepted) or passive (they sent you a request and you accepted)
  has_many :active_friends,   -> { where(friendships: { accepted: true }) },  through: :friendships,         source: :friend # source: tells you who the :active_friend is
  has_many :passive_friends,  -> { where(friendships: { accepted: true }) },  through: :passive_friendships, source: :user

  has_many :requestees,  -> { where(friendships: { accepted: false }) }, through: :friendships,         source: :friend
  has_many :requesters,  -> { where(friendships: { accepted: false }) }, through: :passive_friendships, source: :user

  def friends
    active_friends | passive_friends
  end


  def has_requested(user)
    self.requestees.include? user
  end

  def knows(user)
    self.friends.find(user) || self.requesters.find(user) || self.requestees.find(user)
  end

  # BETS (and bet memberships)
  has_many :memberships

  has_many :agree_bets,   -> { where(memberships: { accepted: true }).where(memberships: { against: false }) },  through: :memberships, source: :bet
  has_many :against_bets, -> { where(memberships: { accepted: true }).where(memberships: { against: true }) },  through: :memberships, source: :bet

  has_many :pending_bets, -> { where(memberships: { accepted: false }) }, through: :memberships, source: :bet

  def active_bets
    agree_bets | against_bets
  end

  def entered_bets
    active_bets | pending_bets
  end

end
