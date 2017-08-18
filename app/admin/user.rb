ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :title, :password, :password_confirmation
  menu priority: 3
  config.batch_actions = true
  #sortable tree: true

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :title
    column :sign_in_count
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :title
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :title
      f.input :superadmin, :label => "Super Genius"
    end
    f.button
  end


  create_or_edit = Proc.new {
    @user            = User.find_or_create_by!(params[:id])
    @user.superadmin = params[:user][:superadmin]
    #@user.attributes = params[:user].delete_if do |k, v|
      # (k == "superadmin") ||
      # (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
  
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit

end
