class Pick < ApplicationRecord  
  belongs_to :user
  belongs_to :match
  belongs_to :prediction,    class_name: "Outcome", primary_key:  :code, foreign_key: :outcome_code, optional: true
end
  