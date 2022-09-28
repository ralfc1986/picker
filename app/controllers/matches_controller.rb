class MatchesController < ApplicationController
  def index
    @matches = Match.display_in_matches.order(:started_at)
  end
end
