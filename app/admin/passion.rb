ActiveAdmin.register Passion do
  menu priority: 2
  before_action :left_sidebar!, only: [:index]
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :category_id, :image
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
    f.input :category, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    f.input :image, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
  end
  f.submit
end

show do
  attributes_table do
    row :title
    row :category
    row :image do |passion|
      image_tag (passion.image.present? ? passion.image.url(:thumb) : 'missing.png'), height: 110
    end
  end
  active_admin_comments
end

end
