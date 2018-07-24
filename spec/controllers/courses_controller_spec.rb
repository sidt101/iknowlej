require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:user) { create(:user) }
  before { allow(controller).to receive(:current_user).and_return(user) }

  describe '#create' do
    let(:course) { build(:course) }
    context 'when logged in as admin' do
      let(:user) { create(:user, :admin) }

      context 'successful course creation' do
        it 'returns a 302' do
          post :create, params: {course: {name: course.name}}
          expect(response).to have_http_status(302)
        end

        it 'creates a new course in the DB' do
          expect{ post :create, params: {course: {name: course.name}} }.to change{ Course.count }.by(1)
        end
      end

      context 'unsuccessful course creation' do
        it 'returns an :unprocessable_entity as the status code' do
          post :create, params: {course: {bad: 'params'}}
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when not logged in as an admin' do
      let(:user) { create(:user) }

      it 'does not create a new course' do
        expect{ post :create, params: {course: {name: course.name}} }.not_to change{ Course.count }
      end
    end
  end

  describe '#destroy' do
    let!(:course) { create(:course) }
    let(:user) { create(:user) }

    it 'renders a 302' do
      delete :destroy, params: {id: course.id}
      expect(response).to have_http_status(302)
    end

    context 'when logged in as admin' do
      let(:user) { create(:user, :admin) }

      it 'destroys the course from the DB' do
        expect{ delete :destroy, params: {id: course.id} }.to change{ Course.count }.by(-1)
      end
    end

    context 'when not logged in as admin' do
      it 'does not destroy the course' do
        expect{ delete :destroy, params: {id: course.id} }.not_to change{ Course.count }
      end
    end
  end
end
