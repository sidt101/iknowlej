require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses" do
    xit "works! (now write some real specs)" do
      get courses_path
      expect(response).to have_http_status(200)
    end
  end
end
