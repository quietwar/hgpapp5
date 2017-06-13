class Admin::CohortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cohort#, only: [:show, :edit, :update, :destroy]

    def index
      @cohort = Cohort.all
      @cohorts = current_user.cohorts
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
      @cohort = current_user.cohorts.find params[:id]
    end

    def cohort_params
      params.require(:cohort).permit(:cohort_id)
    end

    def set_current_room
      if params[:roomId]
        @class = Class.find_by(id: params[:classId])
      else
        @class = current_user.room
      end
      session[:current_class] = @class.id if @class
    end

end
