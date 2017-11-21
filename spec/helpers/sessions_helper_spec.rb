require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) do
    user = FactoryBot.build(:user)
    user.save(:validate => false)
    user
  end
  subject { described_class }


  describe 'current user' do
    subject { helper.current_user }
    context 'does not log in' do
      it { should be_nil }
    end

    context 'does log in' do
      before { helper.login(user) }
      it { should_not be_nil }
    end
  end
end
