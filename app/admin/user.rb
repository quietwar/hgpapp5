ActiveAdmin.register User, :as => 'Genius' do
# ActiveAdmin.register Project do
#   belongs_to :user

  permit_params :avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :projects_attributes, avatar_attributes: [:_destroy]
  menu priority: 4
  config.batch_actions = true

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
        image_column :avatar, style: :thumb

        actions
      end



  filter :genius
  filter :cohort_id
  filter :city
  filter :stipend
  filter :projects
  filter :username
  filter :feature
  filter :sign_in_count
  filter :created_at

  form do |f|
      ### Declare here the model's own form fields:
  f.inputs "Genius" do
    f.input :genius
    f.input :cohort_id
    f.input :city
    f.input :cell
    f.input :email
    if !f.object.new_record?
          f.input :password
          f.input :password_confirmation, input_html: { autocomplete: "new-password" }
    f.input :email2
    f.input :username
    f.input :avatar, as: :file
    if f.object.avatar.present?
      f.semantic_fields_for :avatar_attributes do |avatar_fields|
       avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
  end
    ### Declare here the form for the child model, using the "has_many" method:
    f.inputs "Projects" do
      f.has_many :projects,allow_destroy: true,
                            new_record: true do |a|
      a.input :app_name
      a.input :coding
      a.input :project_details
      a.input :start_date
      a.input :github

       end
     end
   end
    f.actions
        end
      end
    end
  #end

  # sidebar "Genius Details", only: [:show, :edit] do
  #   ul do
  #     li link_to "Projects",    admin_user_projects_path(resource)
  #     li link_to "Attendances", admin_user_attendances_path(resource)
  #   end
  # end


    sidebar "Attendance Details", only: :show do
      attributes_table_for genius, :start_date, :start_date, :created_at
    end

    sidebar "Project History", only: :show do
      attributes_table_for genius do
        #row("Total Projects") { genius.projects.complete.count }
        row("Total Value") do
        end
      end
    end
end
