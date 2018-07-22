require 'rails_helper'

RSpec.describe CourseEnrollmentController, type: :controller do

  describe "GET #enroll" do
    it "returns http success" do
      get :enroll
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unenroll" do
    it "returns http success" do
      get :unenroll
      expect(response).to have_http_status(:success)
    end
  end

end
