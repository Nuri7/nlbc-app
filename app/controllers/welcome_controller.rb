class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :programming, :dancing, :photography, :boxing, :trainers, :qajava]
  before_action :require_admin, only: [:delete_user, :all_users]

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

  def all_users
    @users = User.all
  end



  def delete_user
    @user = User.find(params[:id])
    if @user.role_id == 2
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

  private

  def require_admin
    if current_user.role.name != 'admin'
      flash[:danger] = "You can't access that page."
      redirect_to root_path
    end
  end
end
