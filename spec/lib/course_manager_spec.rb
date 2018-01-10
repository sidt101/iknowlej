require 'rails_helper'
RSpec.describe CourseManager do
  let!(:course) { FactoryBot.create(:course) }
  let!(:user_1) { FactoryBot.create(:user) }
  let!(:user_2) { FactoryBot.create(:user) }
  subject { described_class.new(course) }

  describe '#add_users' do
    before { subject.add_users([user_1]) }
    it 'adds a single user to the course' do
      expect(course.users).to match_array [user_1]
    end
  end
end
