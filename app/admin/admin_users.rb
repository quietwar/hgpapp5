ActiveAdmin.register AdminUser, :as => 'Staff' do
  role_changeable
  actions :all
  permit_params :first_name, :last_name, :email, :email2,:cell, :title, :password, :password_confirmation, :role, :superadmin
  menu priority: 2
  config.batch_actions = true
  #sortable tree: true
  #active_admin_comments

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :city
    column :cell
    column :title
    column :email2
    column :superadmin
    column :sign_in_count
    column :created_at


    actions
  end

  filter :first_name
  filter :last_name
  filter :title
  filter :city
  filter :title
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :email2
      f.input :title
      f.input :city
      f.input :cell
      f.input :superadmin, :label => "Super Genius"
      f.input :password
      if !f.object.new_record?
            f.input :password
            f.input :password_confirmation, input_html: { autocomplete: "new-password" }

    end
    f.actions
  end
  end
end
