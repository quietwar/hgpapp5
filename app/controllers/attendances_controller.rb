class AttendancesController < ApplicationController
  before_action :set_classroom

def new
    @attendance = @classroom.attendances.new
end

def create
    #@attendance = Attendance.new(attendance_params)
    @attendance = @cohort.attendances.new(params[:milestone])
    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
end

def set_classroom
   @cohort = Cohort.find(params[:cohort_id])
   @classroom = @cohort.classrooms.find(params[:classroom_id])
end
