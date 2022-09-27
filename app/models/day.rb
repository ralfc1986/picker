class Day < ApplicationRecord
  has_many :matches
  has_many :picks, through: :matches
  has_many :league_by_days, dependent: :destroy
  has_many :league_masters, dependent: :destroy

  scope :today,     -> { where(match_date: Date.today)}
  scope :yesterday, -> { where(match_date: Date.yesterday)}
end
  