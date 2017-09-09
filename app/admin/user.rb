ActiveAdmin.register User do
  menu priority: 9
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :first_name, :last_name, :male, :provider, :role, :password, :password_confirmation
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  before_action :left_sidebar!, only: [:index]
  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :email, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :password, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :password_confirmation, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :first_name, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :last_name, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :male, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
      f.input :role, :wrapper_html => { class: 'form-group' }, :input_html => { class: 'form-control' }
    end
    f.submit
  end

  index do
    selectable_column
    column :id
    column :email
    column :first_name
    column :last_name
    column "Gender Male ?", :male do |user|
      user.male
    end
    column :provider
    column :role
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row "Gender Male ?", :male do |user|
        user.male
      end
      row :provider
      row :role
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
      row :avatar do |user|
        image_tag (user.avatar.present? ? user.avatar.url(:thumb) : 'missing.png'), height: 110
      end
    end
    active_admin_comments
  end

end
