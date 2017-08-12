class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    #@project = current_user.projects
    #@friends = current_user.friend
    set_current_room
    @features = User.paginates_per(:page => params[:per_page => 1])
    @message = Message.new
    @messages = current_room.messages if current_room
    @followers = Friendship.where(friend_id: current_user.id)
  end

  def show
  end

  def new
    @project = Projects.new
  end

  def create
    @project = projects.new(project_params)

    if @project.save
      flash[:notice] = "project has been created"
      redirect_to [current_user, @project]
    else
      flash.now[:alert] = "project has not been created"
      render :new
    end
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

  def set_project
    @project = current_user.projects.find params[:id]
  end

  def project_params
    params.permit(:app_name, :language, :project_details, :start_date, :user_id, :avatar, :username)
  end

  def set_current_room
    if params[:roomId]
      @room = room.find_by(id: params[:roomId])
    else
      @room = current_user.room
    end
    session[:current_room] = @room.id if @room
  end

end
