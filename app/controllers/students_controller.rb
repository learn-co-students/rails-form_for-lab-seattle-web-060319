class StudentsController < ApplicationController

  def show
    find_student
  end

  def new
    @student = Student.new
  end

  def edit
    find_student
  end

  def create
    @student = Student.new(params.require(:student).permit(:first_name, :last_name))
    @student.save
    redirect_to student_path(@student)
  end

  def update
    find_student
    @student = Student.update(params.require(:student).permit(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

end
