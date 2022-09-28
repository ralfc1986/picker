class Match < ApplicationRecord
  belongs_to :day
  belongs_to :home,       class_name: "Country", primary_key:  :code, foreign_key: :home_country_code, optional: true
  belongs_to :away,       class_name: "Country", primary_key:  :code, foreign_key: :away_country_code, optional: true
  belongs_to :stage,      class_name: "Stage",   primary_key:  :code, foreign_key: :stage_code
  belongs_to :result,     class_name: "Outcome", primary_key:  :code, foreign_key: :outcome_code, optional: true

  has_many :picks

  scope :display_in_matches,   ->  { joins(:day).merge(Day.today_future).where("matches.home_country_code IS NOT NULL AND matches.away_country_code IS NOT NULL")}

  validates :started_at, presence: true

  def completed?
    started? && result.present?
  end

  def started?
    started_at < Time.now
  end

  def winner_odds
    return if result.nil?
    return home_odds if result.code = "HOME"
    return draw_odds if result.code = "DRAW"
    return away_odds if result.code = "AWAY"
  end

end
  