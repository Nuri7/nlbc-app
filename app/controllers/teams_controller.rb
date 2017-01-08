class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @numbers = Number.last
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
      flash[:notice] = "Successfuly created team"
    else
      redirect_to new_team_path
      flash[:error] = "Something went wrong, please select one or more users"
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
