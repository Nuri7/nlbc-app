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

    all_users.shuffle!

    how_many.times do
      people.times do
        if params[:gender] == '3'
          male_user = User.where(id: all_users.pluck(:id)).where(male: true).first
          female_user = User.where(id: all_users.pluck(:id)).where(male: false).first
          if !male_user.nil? and !female_user.nil?
            users.push(male_user.id)
            all_users.delete(male_user)
            users.push(female_user.id)
            all_users.delete(female_user)
          end
        else
          id = all_users.pop
          if params[:team][:male].present?
            users.push(id.id) if id.male == true
          elsif params[:team][:female].present?
            users.push(id.id) if id.male == false
          else
            users.push(id.id)
          end
        end
      end
      @team = Team.new(user_ids: users)
      users = []
      if !@team.user_ids.empty?
        if @team.save
          next
        else
          redirect_to root_path
        end
      else
        next
      end
    end
    redirect_to teams_path
  end

  def delete_all
    Team.destroy_all
    flash[:notice] = "All teams were successfuly deleted."
    redirect_to teams_path
  end

  def create

  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:male, :female, :mix_genders, :per_team, user_ids: [])
  end
end
