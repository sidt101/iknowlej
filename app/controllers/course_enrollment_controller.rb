class CourseEnrollmentController < ApplicationController
  before_action :set_course

  def enroll
    binding.pry
    current_user.courses << @course
    format.html { redirect_to @course, notice: 'You successfully enrolled in this course' }
  end

  def unenroll
    current_user.courses.delete(@course)
    format.html { redirect_to @course, notice: 'You successfully unenrolled in this course' }
  end

  private

  def course_enrollment_params
    params.require(:course_enrollment).permit(:course_id)
  end

  def set_course
    @course = Course.find_id(id: course_enrollment_params[:course_id)
  end
end
