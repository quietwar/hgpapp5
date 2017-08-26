class CohortsController < ApplicationController
  #before_action :authenticate_admin!
  before_action :set_cohort#, only: [:show, :edit, :update, :destroy]

    def index
      @cohort = Cohort.all
      @cohorts = current_admin.cohorts

        respond_to do |format|
      format.html
      format.json { render json: UsersDatatable.new(view_context) }
      end
    end

    def show
      @cohort = cohort.find(params[:cohort])
    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(cohort_params)
    end

    def destroy

    end

    private

    def set_cohort
      @cohort = current_admin.cohorts.find params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:cohort_id)
    end

    def set_current_room
      if params[:roomId]
        @class = Class.find_by(id: params[:classId])
      else
        @class = current_admin.room
      end
      session[:current_class] = @class.id if @class
    end

end
