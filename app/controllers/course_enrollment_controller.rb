class CourseEnrollmentController < ApplicationController
  before_action :set_course

  def enroll
    current_user.courses << @course
    redirect_to @course, notice: 'You successfully enrolled in this course'
  end

  def unenroll
    current_user.courses.delete(@course)
    redirect_to @course, notice: 'You successfully unenrolled in this course'
  end

  private

  def set_course
    @course = Course.find_by(id: params[:course_id].to_i)
  end
end
