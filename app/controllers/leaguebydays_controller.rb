class LeaguebydaysController < ApplicationController
  def index
    @standings_day1 = LeagueByDay.on_day(1).order(points: :desc)
    @standings_day2 = LeagueByDay.on_day(2).order(points: :desc)
    @standings_day3 = LeagueByDay.on_day(3).order(points: :desc)
  end

  def show

  end    
end
