ActiveAdmin.register UserChallenge do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
before_action :left_sidebar!, only: [:index]
permit_params :user_id, :challenge_id, :times
# permit_params :list, :of, :attributes, :on, :model
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
    f.input :challenge, :as => :select, :collection => Challenge.order(:title).map{|u| ["#{u.title} - Passion: #{u.passion.title}", u.id]}
    f.input :times
  end
  f.submit
end

end
