class FeedbacksController < ApplicationController
  before_action :require_admin, except: [:new, :create]

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
    @feedbacks = Feedback.where(bootcamp_id: bootcamp).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  private

  def require_admin
    if current_user.role != 'admin'
      flash[:danger] = "You can't access that page."
      redirect_to root_path
    end
  end

  def feedback_params
    params.require(:feedback).permit(:name, :bootcamp_id, :company_and_position, :rate_bootcamp, :most_value, :least, :describe_bootcamp, :rate_trainer, :tips_to_trainer,
                                     :suggestion, :other_bootcamps, :contact, :plans)
  end

end
