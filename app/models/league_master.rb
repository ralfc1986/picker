class LeagueMaster < ApplicationRecord
  belongs_to :day
  belongs_to :user

  default_scope      {order(position: :asc)}
  scope :today,   -> { joins(:day).merge(Day.today)}
  scope :yesterday,   -> { joins(:day).merge(Day.yesterday)}
  scope :on_day,  -> (inp_day) { where(day: inp_day)}
  scope :by_user, -> (user_id) { where(users: user_id)}
  scope :on_day_by_user, -> (inp_day, user_id) { where(day: inp_day, users: user_id)}

  def self.process_scores
    # Calculate the league table till today
    day_until = Day.today.try(:match_day)    
    return if day_until.nil?
    # Re-calculate from day 1 up
    for day in 1..day_until do 
      process_points_by_day(day)
      process_position_by_day(day)     
    end
  end

  private

  def self.process_points_by_day(day)
    league_on_day_hash = LeagueByDay.get_user_points_hash(day)
    return if league_on_day_hash.nil? 
    prev_league_on_day_hash = day>1 ?  self.get_user_points_hash(day-1) : nil      
    league_on_day_hash.each do |k,v|
      points = prev_league_on_day_hash.present? ? (v + prev_league_on_day_hash[k]) : v
      existing_record = self.where(day_id: day, user_id: k).first
      # create_or_update replacement
      if existing_record.present?
        existing_record.update!(points: points) 
      else
        self.create!(day_id: day, user_id: k, points: points) 
      end
    end
  end

  def self.process_position_by_day(day)    
    league_master_on_day = self.on_day(day)
    return if league_master_on_day.nil? || league_master_on_day.where(points: nil).exists?
    # Reset all position for league_master on day
    league_master_on_day.update_all(position: nil, position_movement: nil)
    # Get the placement for the day before
    prev_league_master_hash = day>1 ?  self.get_user_position_hash(day-1) : nil
    for position in 1..league_master_on_day.count
      current_top = league_master_on_day.where(position: nil).order(points: :desc).first
      # Update current position
      current_top.update_columns(position: position)
      # Update position movement compare to position in previous day
      current_top.update_columns(position_movement: ( prev_league_master_hash[current_top.user_id] - position))  if prev_league_master_hash.present?      
    end
  end

  def self.get_user_points_hash(day)
    self.on_day(day).pluck(:user_id, :points).to_h
  end

  def self.get_user_position_hash(day)
    self.on_day(day).pluck(:user_id, :position).to_h
  end

end
  