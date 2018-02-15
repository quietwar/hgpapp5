ActiveAdmin.register User, :as => 'Genius' do
  permit_params :avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmarks, avatar_attributes: [:_destroy]
  menu priority: 4
  config.batch_actions = true
  #active_admin_importable


  # show title: :username do
  #   columns do
  #     column do
  #       panel "Project Info" do
  #        table_for Project.order("id desc").limit(10) do
  #          column("Project", sortable: :id) do |project|
  #           ul "Project" do
  #         end
  #       end
  #     end

    # columns("Info") do |i|
    #   column do
    #     panel "Genius Info" do
    #       table_for User do

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
      f.input :password, input_html: { autocomplete: "new-password" }
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
   #   end
   #  end
   # end
#   end
# end
    # sidebar "Attendance Details", only: :show do
    #   attributes_table_for user, :username, :email, :created_at
    # end
    #
    # sidebar "Assignment History", only: :show do
    #   attributes_table_for user do
    #     row("Total Orders") { user.orders.complete.count }
    #     row("Total Value") do
    #       number_to_currency user.orders.complete.sum(:total_price)
    #     end
    #   end
    # end
    # sidebar "HGP Lounge" do
    #   render("/admin/sidebar_links", model: "users")
#  end
# end
