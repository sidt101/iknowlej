require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  before { allow(controller).to receive(:current_user).and_return(FactoryBot.create(:user)) }

  describe '#create' do
    let(:course) { FactoryBot.build(:course) }
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

  describe '#destroy' do
    let!(:course) { FactoryBot.create(:course) }

    it 'renders a 302' do
      delete :destroy, params: {id: course.id}
      expect(response).to have_http_status(302)
    end

    it 'destroys the course from the DB' do
      expect{ delete :destroy, params: {id: course.id} }.to change{ Course.count }.by(-1)
    end
  end
end
