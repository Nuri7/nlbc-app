class FeedbacksController < ApplicationController
  before_action :require_admin, only: [:index]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:success] = "Thank you for your feedback"
      redirect_to root_path
    else
      flash[:danger] = "We are sorry but there was an error, please fill the from again."
      render :new
    end
  end

  def index
    @feedbacks = Feedback.select(:bootcamp_id).uniq
  end

  def show
    bootcamp = params[:id].to_i
    
    @bootcamp_name = Bootcamp.find(bootcamp)
    @feedbacks = Feedback.where(bootcamp_id: bootcamp)
  end

  private

  def require_admin
    if current_user.role.name != 'admin'
      flash[:danger] = "You can't access that page."
      redirect_to root_path
    end
  end

  def feedback_params
    params.require(:feedback).permit(:text, :bootcamp_id)
  end

end
