class PicksController < ApplicationController
  def update

  end

  private
  def set_pick
    @pick = Pick.find(params[:id])
  end

  def pick_params
    params.require(:pick).permit(:outcome_code)
  end
end
