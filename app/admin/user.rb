ActiveAdmin.register User, :as => 'Genius' do
  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend, :benchmark, :projects
  menu priority: 4
  config.batch_actions = true



  # sidebar "Genius Details", only: => [:show, :edit] do
  #   ul do
  #     li link_to "Goals",  admin_genius_goals_path(genius)
  #     li link_to "Features", admin_genius_features_path(genius)
  #   end
  # end

  #sortable tree: true

  index do
    selectable_column
    id_column
    column :cohort_id
    column :genius
    column :email
    column :email2
    column :username
    column :city
    column :cell
    column :projects
    column :sign_in_count
    column :created_at
    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :username
  filter :sign_in_count
  filter :created_at
  filter :projects

  form do |f|
    f.inputs do
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :email2
      f.input :password
      f.input :password_confirmation
      f.input :username
      f.input :projects



    end
    f.actions

  end
end
