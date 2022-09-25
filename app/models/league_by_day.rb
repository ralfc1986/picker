class LeagueByDay < ApplicationRecord
  belongs_to :day
  has_many :users

  scope :on_day, -> (inp_day) { where(day: inp_day)}
  scope :by_user, -> (user_id) { where(users: user_id)}
  scope :on_day_by_user, -> (inp_day, user_id) { where(day: inp_day, users: user_id)}

  validates_uniqueness_of :user_id, scope: :day

  def self.process_scores(day)
    day_obj = Day.find(day)
    return if day_obj.matches.where(outcome_code: nil).present?
    
    day_obj.matches.each do |match|
      weightage = match.stage.weighting
      winner_points = match.winner_odds*weightage
      # Update all picks score to -weightage
      match.picks.update_all(score: -weightage)
      # Scope all the winner picks and update the points at 1 go
      match.picks.by_winners.update_all(score: winner_points)
    end

    users_daily_score_hash =  day_obj.picks.group(:user_id).sum(:score)

    users_daily_score_hash.each do |i|
      self.create(day_id: day, user_id: i.first, points: i.last )
    end

    LeagueMaster.process_scores

  end
    
end
  