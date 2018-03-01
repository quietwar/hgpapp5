ActiveAdmin.register Cohort do#, :as => 'Hgp cohorts'
# ActiveAdmin.register User do
#     belongs_to :cohort
  permit_params :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :stipend,:project, :benchmark, :projects
  menu priority: 3
  config.batch_actions = true
  #active_admin_importable
  #sortable tree: true


  index do
    selectable_column
    id_column
    column :cohort_id
    column :city


    actions
  end

  filter :genius
  filter :cohort_id
  filter :city
  filter :username


    form do |f|
        ### Declare here the model's own form fields:
    f.inputs "Hgp Cohorts" do
      f.input :city, label: "Office Location"
      f.input :cohort_id, label: "Cohort Number"
    end
      ### Declare here the form for the child model, using the "has_many" method:
      f.inputs "Geniuses" do
        f.has_many :users,allow_destroy: true,
                              new_record: true do |u|
          u.input :genius
          u.input :cell
          u.input :email
          u.input :password, input_html: { autocomplete: "new-password" }
          u.input :email2
          u.input :username
          u.input :avatar, as: :file
          if u.object.avatar.present?
            u.semantic_fields_for :avatar_attributes do |avatar_fields|
             avatar_fields.input :_destroy, as: :boolean, label: 'Delete?'
           end
       end
      end
      f.actions
      end
    end
  end
