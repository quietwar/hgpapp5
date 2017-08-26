class ClassroomsController < ApplicationController

  def index
    @users = User.paginates_per(:page => params[:per_page => 1])
  end


  def search
    @users = User.search_by_name(params[:search_name]).paginates_per(page: params[:page])
  end
end
