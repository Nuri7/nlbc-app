module PassionsHelper
  def can_download?(challenge_id)
    if (current_user and UserChallenge.where(user_id: current_user.id, challenge_id: challenge_id).any?) ||
      (current_user and current_user.role == 'admin')
      true
    else
      false
    end
  end
end
