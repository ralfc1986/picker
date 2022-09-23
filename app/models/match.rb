class Match < ApplicationRecord

  belongs_to :day
  belongs_to :home,       class_name: "Country", primary_key:  :code, foreign_key: :home_country_code
  belongs_to :away,       class_name: "Country", primary_key:  :code, foreign_key: :away_country_code
  belongs_to :result,     class_name: "Outcome", primary_key:  :code, foreign_key: :winner

  def completed?
    started? && result.present?
  end

  def started?
    started_at < Time.now
  end

end
  