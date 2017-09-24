module ApplicationHelper
  def is_teacher?(user)
    Teacher.where(user: user).any?
  end

  def show_loader?
    if (controller_name == 'nlbc' && action_name == 'teach')
      false
    elsif %(nlbc passions).include?(controller_name)
      true
    else
      false
    end
  end

  def white_link?
    if current_page?(root_path) ||
      (controller_name == 'passions' && action_name == 'show') ||
      current_page?(nlbc_enterprise_path) ||
      current_page?(nlbc_teach_path)
      true
    end

  end
end
