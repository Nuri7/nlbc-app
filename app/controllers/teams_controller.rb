class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @numbers = Number.last
  end

  def multicreate
    team = Team.new(team_params)

    people = team.per_team
    size = team.users.size
    how_many = size/people
    all_users = []
    users = []
    team.users.each do |user|
      all_users.push(user)
    end

    how_many.times do
      people.times do
        id = all_users.pop
        users.push(id.id)
      end
      @team = Team.new(user_ids: users)
      users = []
      if @team.save
        next
      else
        redirect_to root_path
      end
    end
    redirect_to teams_path
  end

  def create

  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:per_team, user_ids: [])
  end
end
