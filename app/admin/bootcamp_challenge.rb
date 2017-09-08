ActiveAdmin.register BootcampChallenge do
  menu priority: 5
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
before_action :left_sidebar!, only: [:index]
permit_params :bootcamp_id, :challenge_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
