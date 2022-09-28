class LeaguemastersController < ApplicationController
  def index
    # @latest_standings = LeagueMaster.today
    @latest_standings_day1 = LeagueMaster.on_day(1)
    @latest_standings_day2 = LeagueMaster.on_day(2)
    @latest_standings_day3 = LeagueMaster.on_day(3)
  end

  def show

  end  
end
