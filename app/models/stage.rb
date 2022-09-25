class Stage < ApplicationRecord
  self.primary_key = 'code'
  
  has_many :matches
end
  