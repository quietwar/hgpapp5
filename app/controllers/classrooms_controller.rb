class ClassroomsController < ApplicationController

  def index
    @classrooms = Classroom.all
    @users = User.paginates_per(:page => params[:per_page => 1])

  end

  def show
    redirect_to root_path
  end

  def search
    @users = User.search_by_name(params[:search_name]).paginates_per(page: params[:page])
  end
end
