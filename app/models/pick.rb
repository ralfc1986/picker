class Pick < ApplicationRecord  
  belongs_to :user
  belongs_to :match
  belongs_to :outcome,    class_name: "Outcome", primary_key:  :code, foreign_key: :outcome_code
end
  