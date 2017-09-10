class PassionsController < ApplicationController
  skip_before_action :authenticate_user!
  def show
    @passion = Passion.find(params[:id])
  end

  private

  def team_params
    params.require(:passion).permit(:title, :category_id, :image)
  end
end
