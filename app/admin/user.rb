ActiveAdmin.register User, :as => 'Genius' do
  permit_params :avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmarks, avatar_attributes: [:_destroy]
  menu priority: 4
  config.batch_actions = true
  active_admin_importable
  
  # index do
  #
  # end

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
    #image_column :avatar, style: :thumb
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
    image_column :avatar, style: :thumb

    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :stipend
  filter :benchmarks
  filter :username
  filter :feature
  filter :sign_in_count
  filter :created_at


  form do |f|
    f.inputs do
      f.input :genius
      f.input :cohort_id
      f.input :city
      f.input :cell
      f.input :email
      f.input :email2
      f.input :username
      f.input :avatar, as: :file
      if f.object.avatar.present?
        f.semantic_fields_for :avatar_attributes do |avatar_fields|
         avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
       end
     end
   end
    f.actions
  end
end
