ActiveAdmin.register Challenge do
  menu priority: 3
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
before_action :left_sidebar!, only: [:index]
permit_params :title, :description, :passion_id, :number, :image
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
    f.input :title, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    f.input :description, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    f.input :number, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    f.input :passion, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    f.input :image, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
  end
  f.submit
end

show do
  attributes_table do
    row :title
    row :description
    row :number
    row :passion
    row :image do |challenge|
      image_tag (challenge.image.present? ? challenge.image.url(:thumb) : 'missing.png'), height: 110
    end
  end
  active_admin_comments
end

end
