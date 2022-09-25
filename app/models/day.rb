class Day < ApplicationRecord
  has_many :matches
  has_many :picks, through: :matches
end
  