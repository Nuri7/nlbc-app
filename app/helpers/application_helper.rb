module ApplicationHelper
  def is_teacher?(user)
    Teacher.where(user: user).any?
  end

  def show_loader?
    %(nlbc passions).include?(controller_name)
  end
end
