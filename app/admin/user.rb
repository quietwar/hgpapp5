ActiveAdmin.register User do
  permit_params :first_name, :cohort, :last_name, :username, :email, :password, :password_confirmation
  menu priority: 4
  config.batch_actions = true
  #sortable tree: true

  index do
    selectable_column
    id_column
    column :cohort
    column :first_name
    column :last_name
    column :email
    column :username
    column :city
    column :email
    column :email2
    column :cell
    column :projects
    column :sign_in_count
    column :created_at
    actions
  end

  filter :genius
  filter :cohort
  filter :city
  filter :email
  filter :username
  filter :sign_in_count
  filter :created_at
  filter :projects

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :cohort
      f.input :city
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :username
      f.input :projects



    end
    f.actions
  end
end
