class Pick < ApplicationRecord  
  belongs_to :user
  belongs_to :match
  belongs_to :forecast,    class_name: "Outcome", primary_key:  :code, foreign_key: :outcome_code, optional: true
  
  scope :with_forecast,   -> { where.not(forecast: nil) }
  scope :by_match,        -> ( match_id ) { where(match_id: match_id) }
  scope :by_user,         -> ( user_id )  { where(user_id: user_id) }
  scope :by_winners,      -> { joins(:match).where("matches.outcome_code = picks.outcome_code") }
  scope :with_outcome,    -> { joins(:match).where("matches.outcome_code IS NOT NULL") }
end
  