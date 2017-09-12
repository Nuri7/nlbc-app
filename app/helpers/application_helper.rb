module ApplicationHelper
  def is_teacher?(user)
    Teacher.where(user: user).any?
  end
end
