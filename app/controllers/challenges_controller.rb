class ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :edit, :destroy, :update]
  before_action :authenticate_admin!

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      flash[:success] = 'New challenge was created.'
      redirect_to challenge_path(@challenge)
    else
      flash[:error] = 'Something went wrong, please try again.'
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @challenge.update(challenge_params)
      flash[:success] = "Updated"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong, please try again."
      render :edit
    end
  end

  def destroy
    @challenge.destroy
    flash[:success] = 'Challenge was deleted.'
    redirect_to root_path
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:title, :description, :passion_id, :number, :image)
  end
end
