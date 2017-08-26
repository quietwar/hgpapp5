class Staffs::ClassroomsController < ApplicationController
  #before_action :authenticate_admin!
  #before_action :set_current_classroom, only: [:show, :edit, :update, :destroy]

    #admin home page
    def index
      #@classrooms_grid = ClassroomGrid.new(params[:classrooms_grid]) do |scope|
      scope.page(params[:page])
      # @cohorts = Cohort.all
      # @cohort = Cohort.new
      # print "============================"
      # print current_admin
      # print current_admin.cohorts
      # print @cohort
      # print "============================"
      # current_admin.cohorts << @cohort
      # set_current_cohort
      redirect_to staffs_index_url
      # redirect_to admins_root_path
    end

    def show
      @cohort = cohort.find(params[:cohort])
    end

    def new
      @cohort = Cohort.new
    end

    def create
      @cohort = Cohort.new(cohort_params)
      if @cohort.save
        flash[:notice] = "Cohort has been created"
        redirect_to [current_user, @cohort]
      else
        flash.now[:alert] = "Cohort has not been created"
        render :new
      end
    end

    def destroy

    end

    private

    #def set_cohort
      #@cohort = cohorts.find params[:id]
    #end

    def cohort_params
      params.require(:cohort).permit(:cohort_id)
    end

    def set_current_cohort
      if params[:cohortId]
        @cohort = Cohort.find_by(id: params[:cohortId])
      #else
        #@classroom = classroom.new
      end
      session[:current_cohort] = @cohort.id if @cohort
    end

end
