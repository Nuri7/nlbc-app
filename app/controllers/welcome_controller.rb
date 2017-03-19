class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :require_admin, only: [:delete_user, :all_users]
  def index

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
