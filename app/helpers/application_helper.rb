module ApplicationHelper
  def is_teacher?(user)
    Teacher.where(user: user).any?
  end

  def show_loader?
    %(nlbc passions).include?(controller_name)
  end

  def white_link?
    if current_page?(root_path) ||
      (controller_name == 'passions' && action_name == 'show') ||
      current_page?(nlbc_enterprise_path)
      true
    end

  end
end
