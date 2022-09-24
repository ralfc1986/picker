class Match < ApplicationRecord

  belongs_to :day
  belongs_to :home,       class_name: "Country", primary_key:  :code, foreign_key: :home_country_code, optional: true
  belongs_to :away,       class_name: "Country", primary_key:  :code, foreign_key: :away_country_code, optional: true
  belongs_to :stage,      class_name: "Stage",   primary_key:  :code, foreign_key: :stage_code
  belongs_to :outcome,    class_name: "Outcome", primary_key:  :code, foreign_key: :outcome_code, optional: true

  has_many :picks

  validates :started_at, presence: true

  def completed?
    started? && result.present?
  end

  def started?
    started_at < Time.now
  end

end
  