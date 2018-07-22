class CourseEnrollmentController < ApplicationController
  before_action :set_course

  def enroll
    current_user.courses << @course
    flash[:success] = 'You successfully enrolled in this course'
    render "courses/show"
  end

  def unenroll
    current_user.courses.delete(@course)
    flash[:success] = 'You successfully unenrolled from this course'
    render "courses/show"
  end

  private

  def set_course
    @course = Course.find_by(id: params[:course_id].to_i)
  end
end
