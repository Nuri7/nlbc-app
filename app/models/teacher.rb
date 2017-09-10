class Teacher < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  def self.search_trainers(params)
    trainers = Teacher.all

    if params['challenges'].present?
      selected_teachers = []
      teachers = trainers.where(challenge_id: params['challenges'])
      trainers.each do |trainer|
        potential_trainer = Teacher.where(id: trainer.id)
        trainer_challenges = potential_trainer.map{|trainer| trainer.challenge_id.to_s}.compact.uniq
        if params['challenges'].sort == trainer_challenges.sort
          selected_teachers << trainer.id
        end
      end
      trainers = trainers.where(id: selected_teachers)
    end

    if params['locations'].present?
      bootcamps = Bootcamp.where(location: params['locations']).map{|bo| bo.challenges.map(&:id).compact.uniq}.flatten
      trainers = trainers.where(challenge_id: bootcamps)
    end

    if params['passions'].present?
      passions = Passion.where(id: params['passions']).map{|bo| bo.challenges.map(&:id).compact.uniq}.flatten
      trainers = trainers.where(challenge_id: passions)
    end
    trainers = User.where(id: trainers.collect(&:user_id).compact.uniq)
    trainers
  end

end
