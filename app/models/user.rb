class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# FRIENDS
  has_many :friendships
  has_many :passive_friendships,  class_name: "Friendship",
                                  foreign_key: "friend_id" 
  # friends are either active (you sent then friend request and they accepted) or passive (they sent you a request and you accepted)
  has_many :active_friends,   -> { where(friendships: { accepted: true }) },  through: :friendships,         source: :friend # source: tells you who the :active_friend is
  has_many :passive_friends,  -> { where(friendships: { accepted: true }) },  through: :passive_friendships, source: :user

  has_many :active_requests,  -> { where(friendships: { accepted: false }) }, through: :friendships,         source: :friend
  has_many :passive_requests, -> { where(friendships: { accepted: false }) }, through: :passive_friendships, source: :user

  def friends
    active_friends | passive_friends
  end

  has_many :bets # bet the user created
  

  

end
