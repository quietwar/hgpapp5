class ProjectsController < ApplicationController
  #wrap_parameters format: [:json, :xml, :url_encoded_form, :multipart_form]
  before_action :project_params, only: [:create]
  before_action :authenticate_user!
  before_action :set_project#, except: [:index, :new, :create]


  def index
    @projects = Project.all
     :set_current_room

    #@projects = current_user.project
    #@friends = current_user.friends

    @message = Message.new
    @followers = Friendship.where(friend_id:  :current_user)

    @friends = Friendship.all

    #@followers = User.paginates_per(:page => params[:per_page => 1])
    @message = Message.all
    @message = current_room.message if current_room
  end


  def show
    @project = User.first
    @project = Project.find(params[:id])
    #@friendship = Friendship(:user_id, @friends)
  end

  def new
    @project = Project.new
    #@project = current_user.projects.new
  end

  def create
    #byebug

    @project = Project.new(project_params)

    # if @project
    #   @project.update(project_params)
    #   flash[:notice] = 'Project has been updated'
    #   redirect_to [current_user, @project]
    # else
    #   @project = Projects.new(project_params)

      if @project.save
        flash[:notice] = 'Project has been created'
        redirect_to @project
      else
        flash[:alert] = 'Project has not been created'
        render :new
    #end
    end
  #end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "project has been updated"
      redirect_to [current_user, @project]
    else
      flash[:alert] = "project has not been updated"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "project has been deleted"
    redirect_to user_projects_path(current_user)
  end

private

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_project
    @project = user_projects_path(:current_user)
  end

  def project_params
    params.require(:project).permit(:app_name, :coding, :project_details, :start_date)
    #params.permit(:app_name, :coding, :project_details, :start_date)
  end

  def set_current_room
    if params[:roomId]
      @room = Room.find_by(id: params[:roomId])
    else
      @room = current_user.room
    end
  end
    session[:current_room] = @room.id if @room
  end
#end
