ActiveAdmin.register Cohort, :as => 'Geniuses'  do

  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend,:project, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
  active_admin_importable
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
    column :stipend
    column :benchmark
    column :projects
    #column :feature
    
    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :stipend
  filter :benchmark
  filter :projects
  filter :username
  #filter :feature

  form do |f|
    f.inputs "Hgp Geniuses" do
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :email2
      f.input :stipend
      f.input :benchmark
      f.input :projects
      #f.input :feature
    
    end
    f.actions
  
	end
  end
