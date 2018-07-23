require 'rails_helper'

RSpec.describe Course do
  context 'valid course' do
    it 'is valid' do
      course = build(:course)
      expect(course).to be_valid
    end
  end
  context 'invalid course' do
    it 'is invalid without a name' do
      course = build(:course, name: '')
      expect(course).to_not be_valid
    end
  end
end
