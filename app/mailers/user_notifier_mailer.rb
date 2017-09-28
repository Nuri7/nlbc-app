class UserNotifierMailer < ApplicationMailer
  default :from => 'do-not-reply@nlbc.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_trainer_email(trainer, challenges)
    headers "X-SMTPAPI" => {
     "sub": {
       "%name%" => ["#{trainer.first_name} #{trainer.last_name}"],
       "%challenges%" => ["#{challenges.map{|challenge| challenge.title }.join(', ')}"]
     },
     "filters": {
       "templates": {
         "settings": {
           "enable": 1,
           "template_id": '7ecac38b-b21e-417f-8e0b-4e6c239f98ac'
         }
       }
     }
    }.to_json

    @user = trainer
    @challenges = challenges
    mail( :to => @user.email,
    :subject => "You have new NLBC booking." )
  end
end
