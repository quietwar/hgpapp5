ActiveAdmin.register User, :as => 'Genius' do
  permit_params :avatar, :first_name, :last_name, :username, :genius, :cohort_id, :city, :email, :email2, :cell, :password, :password_confirmation, :stipend, :benchmarks, avatar_attributes: [:_destroy]
  menu priority: 4
  config.batch_actions = true
  active_admin_importable


  show title: :username do
    panel "Project Info" do
      table_for(user.projects) do
        column("Project", sortable: :id) do |project|
          link_to "##{project.id}", admin_project_path(project)
        end
        column("State") { |project| status_tag(project.state) }
        column("Date", sortable: :checked_out_at) do |project|
          pretty_format(project.checked_out_at)
        end
        column("Total") { |project| number_to_currency project.total_price }
      end
    end

    panel "Genius Info" do
      table_for(user.user_info) do
        column("Fullname") do |a|
          link_to a.fullname.to_s,
                  admin_user_user_info_path(user.id, a.id)
        end
        column("Info") do |i|
          span a.address_line1.to_s
          br a.address_line2.to_s
        end
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
        tr class: "action_items" do
          td link_to("New Address", new_admin_user_user_address_path(user),
                     class: :button)
        end
      end
    end
    active_admin_comments
  end


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
    # end

#end
