ActiveAdmin.register Feedback do
  menu priority: 6
  before_action :left_sidebar!, only: [:index]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :plans, :bootcamp_id, :name, :company_and_position, :rate_bootcamp, :most_value, :least, :describe_bootcamp, :rate_trainer, :tips_to_trainer, :suggestion, :other_bootcamps, :contact
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
