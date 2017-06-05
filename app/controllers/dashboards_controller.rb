class DashboardsController < ApplicationController
  def index
    @features = User.paginate(:page => params[:per_page => 1])
  end

  def search
    @features = User.search_by_name(params[:search_name]).paginate(page: params[:page])
  end
end
