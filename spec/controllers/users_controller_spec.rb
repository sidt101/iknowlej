require 'rails_helper'
RSpec.describe UsersController, type: :controller do

  describe "#create" do
    context 'successful signup' do
      let(:user) { FactoryBot.build(:user) }
      it "returns http success" do
        post :create, params: { user: {name: user.name, email: user.email, password: user.password, password_confirmation: user.password} }
        expect(response).to have_http_status(302)
      end

      it 'creates a new user' do
        expect{ post :create, params: { user: {name: user.name, email: user.email, password: user.password, password_confirmation: user.password} }}.to change{ User.count }.by(1)
      end

      it 'logs in the user' do
        post :create, params: { user: {name: user.name, email: user.email, password: user.password, password_confirmation: user.password} }
        expect(controller.current_user).to eq(User.find_by(email: user.email))
      end
    end

    context 'unsuccessful signup' do
      let(:created_user) { FactoryBot.create(:user) }

      it 'returns a 400 when trying to create a duplicate user' do
        post :create, params: { user: {name: created_user.name, email: created_user.email, password: created_user.password, password_confirmation: created_user.password} }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'renders the signup page' do
        expect(post :create, params: { user: {bad: "params"}}).to render_template(:new)
      end
    end
  end
end
