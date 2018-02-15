class CohortsController < ApplicationController
  before_action :set_cohort
  #permit_params :genius, :city, :cohort_id, :cell, :email, :email2

    def index
      @cohort = Cohort.all
      # @cohorts = current_admin.cohorts
      #
      #   respond_to do |format|
      # format.html
      # format.json { render json: UsersDatatable.new(view_context) }
      # end
    end

    def show
      @cohort = Cohort.find(params[:id])
    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(cohort_params)
      @cohort = save!
    end

    def destroy

    end

    private

    def set_cohort
      @cohort = current_admin.cohorts.find params[:id]
    end

    def cohort_params
      params.require(:cohorts).permit(:cohort, :genius, :city, :cohort )
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
