class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def get_passions
    @passions = Passion.all
  end

  def get_bootcamps
    @bootcamps = Bootcamp.all
  end

  helper_method :get_passions
  helper_method :get_bootcamps

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :male])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :male, :avatar])
  end

  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:danger] = 'You are not allowed to access that page.'
      redirect_to root_path
    end
  end

end
