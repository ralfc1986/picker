class PicksController < ApplicationController
  def show
    @user = User.find(params[:user_id])    
    @user_picks_matches = @user.picks.with_results.includes(:match) 
  end

  private
  def pick_params
    params.require(:pick).permit(:user_id)
  end
end

