ActiveAdmin.register Cohort, :as => 'Hgp-cohorts'  do

  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend,:project, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
  #active_admin_importable
  #sortable tree: true

  # sidebar  only: => [:show, :edit] do
  #   ul "Genius Details" do
  #     li link_to "Goals",  admin_genius_goals_path(genius)
  #     li link_to "Features", admin_genius_features_path(genius)
  #   end

  #  end

  index do
    selectable_column
    id_column
    column :cohort_id
    column :genius
    column :username
    column :city
    column :email
    column :email2
    column :cell
    column :password
    column :password_confirmation

    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :username


  form do |f|
    f.inputs "Hgp Geniuses" do
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :email2
      f.input :password
      f.input :password_confirmation

    end
    f.actions

	end
  end
