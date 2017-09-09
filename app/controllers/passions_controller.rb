class PassionsController < ApplicationController

  def show
    @passion = Passion.find(params[:id])
  end

  private

  def team_params
    params.require(:passion).permit(:title, :category_id)
  end
end
