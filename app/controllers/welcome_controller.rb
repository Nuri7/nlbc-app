class WelcomeController < ApplicationController
  def index

  end

  def all_users
    @users = User.all
  end

  def delete_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User was successfuly deleted from database."
    redirect_to :back
  end
end
