class Teacher < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  def self.search_trainers(params)
    trainers = Teacher.all


    if params['challenges'].present?
      trainers = trainers.where(challenge_id: params['challenges'])
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
