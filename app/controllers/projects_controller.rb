class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def index
    @projects = current_user.projects
    @friends = current_user.friends
    set_current_chatroom
    @features = User.paginate(:page => params[:per_page => 1])
    @message = Message.new
    @messages = current_chatroom.messages if current_chatroom
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

  def set_current_chatroom
    if params[:chatroomId]
      @chatroom = Chatroom.find_by(id: params[:chatroomId])
    else
      @chatroom = current_user.chatroom
    end
    session[:current_chatroom] = @chatroom.id if @chatroom
  end

end
