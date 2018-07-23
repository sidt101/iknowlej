require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }

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

  describe '#logged_in?' do
    subject { helper.logged_in? }
    context 'returns true when a user has logged in' do
      before { helper.login(user) }
      it { should be_truthy }
    end

    context 'returns false when no user has logged in' do
      it { should be_falsy }
    end
  end
end
