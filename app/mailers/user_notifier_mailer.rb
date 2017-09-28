class UserNotifierMailer < ApplicationMailer
  default :from => 'do-not-reply@nlbc.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_trainer_email(trainer, challenges)
    @user = trainer
    @challenges = challenges
    mail( :to => @user.email,
    :subject => "You have new booking for #{@challenges}" )
  end
end
