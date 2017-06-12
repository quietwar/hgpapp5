class CohortsController < ApplicationController

    def index
      @cohorts = Cohort.all
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

    def cohort_params
      params.require(:cohort).permit(:cohort_id)
    end
  
end
