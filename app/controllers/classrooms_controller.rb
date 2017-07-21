class ClassroomsController < ApplicationController

  def index
    #redirect_to classroom_url
    @grid = ClassroomsGrid.new(params[:classrooms_grid]) do |scope|
      scope.page(params[:page])
    end
  end

end
