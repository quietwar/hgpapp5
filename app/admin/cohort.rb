ActiveAdmin.register Cohort do

  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
  active_admin_importable
  #sortable tree: true

  index do
    selectable_column
    id_column
    column :cohort_id
    column :genius
    column :city
    column :email
    column :email2
    column :cell
    column :stipend
    column :benchmark
    column :projects
    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :stipend
  filter :benchmark
  filter :projects

  form do |f|
    f.inputs "Hgp Geniuses" do

      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :email
      f.input :email2
      f.input :cell
      f.input :stipend
      f.input :benchmark
      f.input :projects

    end
    f.actions
  end
  end
