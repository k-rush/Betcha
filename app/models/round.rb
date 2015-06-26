class Round < ActiveRecord::Base
  belongs_to :bet 

  has_many :contracts, dependent: :destroy

  has_many :potential_winners, -> { where(contracts: { agrees: true, agree_wins: true, signed: false }) }, through: :contracts, source: :user
  has_many :potential_losers, -> { where(contracts: { agrees: true, agree_wins: false, signed: false }) }, through: :contracts, source: :user

  has_many :winners, -> { where(contracts: { agrees: true, agree_wins: true, signed: true }) }, through: :contracts, source: :user
  has_many :losers, -> { where(contracts: { agrees: true, agree_wins: false, signed: true }) }, through: :contracts, source: :user

end
