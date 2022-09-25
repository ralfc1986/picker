class LeagueMaster < ApplicationRecord
  belongs_to :day
  has_many :users

  default_scope      {order(position: :asc)}
  scope :on_day,  -> (inp_day) { where(day: inp_day)}
  scope :by_user, -> (user_id) { where(users: user_id)}
  scope :on_day_by_user, -> (inp_day, user_id) { where(day: inp_day, users: user_id)}

  def self.process_scores
    # Calculate the league table till yesterday(where all matches before is done)
    # day_no = Day.where(match_date: Date.today).first.match_day - 1 if day_no.nil?
    # Calculate from scratch up(process heavy)
    day_no = LeagueByDay.pluck(:day_id).max
    for i in 1..day_no do
      league_on_day = LeagueByDay.on_day(i)
      return if league_on_day.nil? 
      prev_league_on_day = i>1 ? LeagueByDay.on_day(i-1) : nil
      prev_league_on_day_hash = prev_league_on_day.present? ? prev_league_on_day.pluck(:user_id, :points).to_h : nil
      league_on_day.pluck(:user_id, :points).to_h.each do |k,v|
        points = prev_league_on_day.present? ? (v + prev_league_on_day_hash[k]) : v
        if self.where(day_id: i, user_id: k).present?
          self.update(day_id: i, user_id: k, points: points) 
        else
          self.create(day_id: i, user_id: k, points: points) 
        end
      end
      prev_league_master = i>1 ? self.on_day(i-1) : nil
      prev_league_master.pluck(:user_id, :points).to_h if prev_league_on_day.present?
      prev_league_master_hash = prev_league_master.present? ? prev_league_master.pluck(:user_id, :position).to_h : nil
      for pos in 1..self.on_day(i).count
        byebug
        current_top = self.on_day(i).where(position: nil).order(points: :desc).first
        current_top.update_columns(position: pos)
        if i>1
          prev_position = prev_league_master_hash[current_top.user_id]          
          current_top.update_columns(position_movement: ( prev_position - pos))
        end
      end
    end
  end

end
  