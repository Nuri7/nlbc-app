class Teacher < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  def self.search_trainers(params)
    trainers = Teacher.all

    if params['challenges'].present?
      selected_teachers = []
      teachers = trainers.where(challenge_id: params['challenges'])
      teachers.each do |trainer|
        potential_trainer = Teacher.where(user_id: trainer.user_id)
        trainer_challenges = potential_trainer.map{|trainer| trainer.challenge_id.to_s}.compact.uniq.sort!
        params['challenges'].sort!
        if (trainer_challenges - params['challenges']).empty?
          if params['challenges'] == trainer_challenges
            selected_teachers << trainer.id
          end
        else
          selected_teachers << trainer.id
        end
      end
      trainers = trainers.where(id: selected_teachers)
    end

    trainers = User.where(id: trainers.collect(&:user_id).compact.uniq)
    trainers
  end

end
