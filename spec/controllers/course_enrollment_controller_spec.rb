require 'rails_helper'

RSpec.describe CourseEnrollmentController, type: :controller do
  include SessionsHelper

  let(:course) { create(:course) }
  let(:user) { create(:user) }
  before { login(user) }

  describe "#enroll" do
    it "returns success" do
      post :enroll, params: { course_id: course.id }
      expect(response).to have_http_status(200)
    end

    it 'enrolls the user in the course' do
      post :enroll, params: { course_id: course.id }
      expect(user.courses).to include(course)
    end
  end

  describe "#unenroll" do
    it "returns success" do
      post :unenroll, params: { course_id: course.id }
      expect(response).to have_http_status(200)
    end

    it 'unenrolls the user from the course' do
      user.courses << course
      post :unenroll, params: { course_id: course.id }
      expect(user.reload.courses).to be_blank
    end
  end
end
