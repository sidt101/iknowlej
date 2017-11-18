require 'rails_helper'

RSpec.describe Course do
  subject { Course.new(name: name) }

  context 'valid course' do
    context 'no name' do
      let(:name) { ' ' }
      it { should_not be_valid }
    end
  end
end
