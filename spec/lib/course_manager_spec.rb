require 'rails_helper'
RSpec.describe CourseManager do
  let!(:course) { create(:course) }
  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  subject { described_class.new(course) }

  describe '#add_users' do
    context 'single user' do
      before { subject.add_users([user_1]) }
      it 'adds a single user to the course' do
        expect(course.users).to match_array [user_1]
      end
    end

    context 'multiple users' do
      before { subject.add_users([user_1, user_2]) }
      it 'adds a multiple users to the course' do
        expect(course.users).to match_array [user_1, user_2]
      end
    end
  end

  describe '#remove_users' do
    context 'single user' do
      before do
        course.users << [user_1]
        subject.remove_users([user_1])
      end

      it 'removes a user from the course' do
        expect(course.users).to be_empty
      end
    end

    context 'multiple users' do
      before do
        course.users << [user_1, user_2]
        subject.remove_users([user_1, user_2])
      end

      it 'removes mutiple users from the course' do
        expect(course.users).to be_empty
      end
    end
  end
end
