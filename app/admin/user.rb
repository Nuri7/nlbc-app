ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :last_name, :male, :provider, :role
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# NOTE fix gender and avatar

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :first_name, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :last_name, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :male, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :role, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    end
    f.submit
  end

  show do
    attributes_table :email, :first_name, :last_name, :male, :provider, :role, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at
  end

end
