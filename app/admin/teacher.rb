ActiveAdmin.register Teacher do
  before_action :left_sidebar!, only: [:index]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :user_id, :challenge_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.semantic_errors
  f.inputs do
    f.input :user_id, :as => :select, :collection => User.all.map{|u| ["#{u.email} - #{u.last_name}, #{u.first_name}", u.id]}
    f.input :challenge_id, :as => :select, :collection => Challenge.all.map{|u| ["#{u.title}", u.id]}
  end
  f.submit
end

end
