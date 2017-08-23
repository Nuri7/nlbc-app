class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
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

    if params[:gender] == '3'
      how_many.times do
        people.times do
          male_user = User.where(id: all_users.pluck(:id)).where(male: true).shuffle.first
          female_user = User.where(id: all_users.pluck(:id)).where(male: false).shuffle.first
          if !male_user.nil? and !female_user.nil?
            users.push(male_user.id)
            all_users.delete(male_user)
            users.push(female_user.id)
            all_users.delete(female_user)
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
      end
    end

    if params[:gender] == '2'
      how_many.times do
        people.times do
          if params[:team][:male].present?
            male_user = User.where(id: all_users.pluck(:id)).where(male: true).shuffle.first
            users.push(male_user.id) if !male_user.nil?
            all_users.delete(male_user) if !male_user.nil?
          elsif params[:team][:female].present?
            female_user = User.where(id: all_users.pluck(:id)).where(male: false).shuffle.first
            users.push(female_user.id) if !female_user.nil?
            all_users.delete(female_user) if !female_user.nil?
          else
            id = all_users.pop
            users.push(id.id)
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
