class NlbcController < ApplicationController
  skip_before_action :authenticate_user!, except: [:remove_users, :delete_user]
  before_action :authenticate_admin!, only: [:delete_user, :all_users]

  def index
  end

  def programming
  end

  def dancing
  end

  def photography
  end

  def boxing
  end

  def qajava
  end

  def trainers
    @selected_challenges = nil
    @challenges = Challenge.all
    @passions = Passion.all
    @locations = Bootcamp.all.collect{|bootcamp| bootcamp.location unless bootcamp.location.empty? }.uniq.compact
    if (params[:passions] || params[:challenges] || params[:locations]).present?
      @trainers = Teacher.search_trainers(params)
      @selected_challenges = params[:challenges].join(',')
    else
      @trainers = User.where(id: Teacher.all.map(&:user_id))
    end
  end

  def dropdown_challenges
    if params['passion_ids'].present?
      @options = Passion.where(id: params['passion_ids']).map{|passion| passion.challenges}
      render json: @options.map{|x| x if !x.empty?}.compact.flatten.map{|x| [x.id, x.title]}
    else
      @options = Challenge.all
      render json: @options.map{|x| [x.id, x.title]}
    end
  end

  def privacy
  end

  def subscribe_to_passion
    if UserPassion.where(user_id: params[:user_id], passion_id: params[:passion_id]).present?
      passion = Passion.find(params[:passion_id])
      flash[:warning] = "You have been already subscribed to this passion."
      redirect_to passion_path(passion)
    else
      @subscribe = UserPassion.new(user_id: params[:user_id], passion_id: params[:passion_id])
      if @subscribe.save
        flash[:success] = "You successfuly subscribed to this passion."
        redirect_to edit_user_registration_path
      else
        passion = Passion.find(params[:passion_id])
        flash[:error] = "Something went wrong, please try again."
        redirect_to passion_path(passion)
      end
    end
  end

  def remove_users
    @users = User.all
  end


  def delete_user
    @user = User.find(params[:id])
    if @user.role == 'admin'
      flash[:danger] = "You can't delete admin from database!"
      redirect_to root_path
    else
      passions = UserPassion.where(user_id: @user.id)
      if passions.present?
        passions.each do |passion|
          passion.destroy
        end
      end
      @user.destroy
      flash[:notice] = "User was successfuly deleted from database."
      redirect_to :back
    end
  end

end
