class TeachersController < ApplicationController
  before_action :verify_teacher

  def teacher_information
    @user = current_user
  end

  private

  def verify_teacher
    if !current_user.teachers.any?
      redirect_to root_path
    end
  end

end
