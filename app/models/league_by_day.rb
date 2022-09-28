class LeagueByDay < ApplicationRecord
  belongs_to :day
  belongs_to :user

  scope :today,   -> { joins(:day).merge(Day.today)}
  scope :yesterday,   -> { joins(:day).merge(Day.yesterday)}
  scope :on_day, -> (inp_day) { where(day: inp_day)}
  scope :by_user, -> (user_id) { where(users: user_id)}
  scope :on_day_by_user, -> (inp_day, user_id) { where(day: inp_day, users: user_id)}

  validates_uniqueness_of :user_id, scope: :day

  def self.process_scores(day)
    day_obj = Day.find(day)
    day_matches = day_obj.matches
    # return if none of the matches on the day has result
    return if day_matches.count == day_matches.where(outcome_code: nil).count
    process_picks_score(day_matches)
    # Update total score for each user into the league_by_day table
    users_daily_score_hash = day_obj.picks.group(:user_id).sum(:score)
    users_daily_score_hash.each do |i|
      existing_record = self.where(day_id: day, user_id: i.first).first
      # create_or_update replacement
      if existing_record.present?
        existing_record.update!(points: i.last)
      else
        self.create!(day_id: day, user_id: i.first, points: i.last )
      end      
    end
    # Trigger to update the league_master table
    LeagueMaster.process_scores
  end

  def self.daily_mvps(day)
    daily_table = self.on_day(day)
    # points that is nil means table has not process before
    return if daily_table.nil? || daily_table.where(points: nil).exists?
    highest_points = daily_table.maximum(:points)
    # daily_table.joins(:user).where(points: highest_points)
    User.joins(:league_by_days).where(league_by_days: {points: highest_points, day_id: day})
  end

  def self.get_user_points_hash(day)
    self.on_day(day).pluck(:user_id, :points).to_h
  end
    
  private

  def self.process_picks_score(day_matches)
    # weightage for all the matches within the day is the same
    weightage = day_matches.first.stage.weighting
    # process the all the picks points
    day_matches.order(:started_at).each do |match|
      # does not include match that has not started
      # unless match.started?
      #   # reset the score for current and all the next matches(if current match has not started)
      #   match.picks.update_all(score: 0)
      #   next
      # end
      winner_points = match.winner_odds*weightage
      # Update all picks score to -weightage
      match.picks.update_all(score: -weightage)
      # Scope all the winner picks and update the points at 1 go
      match.picks.by_winners.update_all(score: winner_points)
    end    
  end

end
  