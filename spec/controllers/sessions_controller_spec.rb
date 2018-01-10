require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  let!(:user) { FactoryBot.create(:user) }
  let (:session_for_valid_user) do
    { :email => user.email,
      :password => user.password
    }
  end

  let (:session_for_invalid_user) do
    { :email => "fake@fake.com",
      :password => "fakefake"
    }
  end

  describe "POST #create" do
    it "successfully creates a session" do
      post :create, :params => { :session => session_for_valid_user }
      expect(response).to redirect_to(user)
    end

    it "redirects to login page when credentials are incorrect" do
      post :create, :params => { :session => session_for_invalid_user }
      expect(response).to render_template(:new)
    end
  end

end
