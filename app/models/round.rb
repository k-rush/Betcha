class Round < ActiveRecord::Base
  belongs_to :bet 

  has_many :contracts, dependent: :destroy

  has_many :players, through: :contracts, source: :user

  has_many :agree_players,   -> { where(contracts: { agreed: true }) },  through: :contracts, source: :user
  has_many :against_players, -> { where(contracts: { agreed: false }) }, through: :contracts, source: :user

  has_many :potential_winners, -> { where(contracts: { agreed: true, agree_wins: true, signed: false }) }, through: :contracts, source: :user
  has_many :potential_losers, -> { where(contracts: { agreed: true, agree_wins: false, signed: false }) }, through: :contracts, source: :user

  has_many :winners, -> { where(contracts: { agreed: true, agree_wins: true, signed: true }) }, through: :contracts, source: :user
  has_many :losers, -> { where(contracts: { agreed: true, agree_wins: false, signed: true }) }, through: :contracts, source: :user

end
