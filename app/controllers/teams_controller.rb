class TeamsController < ApplicationController

  def new
    @team = Team.new
    @numbers = Number.last
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
      flash[:notice] = "ok"
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(user_ids: [])
  end
end
