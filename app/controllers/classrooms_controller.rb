class ClassroomsController < ApplicationController

  def index
    @features = User.paginates_per(:page => params[:per_page => 1])
  end

  def search
    @features = User.search_by_name(params[:search_name]).paginates_per(page: params[:page])
  end
end

 
