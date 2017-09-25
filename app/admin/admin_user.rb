ActiveAdmin.register AdminUser, :as => 'Staff' do
  actions :all
  permit_params :first_name, :last_name, :email, :title, :password, :password_confirmation, :superadmin
  menu priority: 2
  config.batch_actions = true
  #sortable tree: true

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :title
    column :email2
    column :sign_in_count
    column :created_at
    column :current_user_email do
    current_user.try(:email)
  end
    actions
  end

  filter :first_name
  filter :last_name
  filter :title
  filter :superadmin
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :email2
      f.input :password
      f.input :password_confirmation
      f.input :title
      #f.input :superadmin, :label => "Super Genius"
    end
    f.actions
  end
end
