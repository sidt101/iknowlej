require 'rails_helper'

RSpec.describe User do

  describe '#admin?' do
    context 'when an admin' do
      let(:user) { FactoryBot.build(:user, permission_type: :student) }

      it { expect(user.admin?).to be(false) }
    end

    context 'when not an admin' do
      let(:user) { FactoryBot.build(:user, :admin) }

      it { expect(user.admin?).to be(true) }
    end
  end

  context 'valid user' do
    let(:name) { 'Sid Tandon' }
    let(:email) { 'sid@boss.com' }
    let(:password) { 'foobar' }
    let(:password_confirmation) { 'foobar' }

    subject do
      FactoryBot.build(:user, name: name, email: email, password: password, password_confirmation: password_confirmation)
    end

    context 'no name' do
      let(:name) { ' ' }
      it { should_not be_valid }
    end

    context 'no email address' do
      let(:email) { ' ' }
      it { should_not be_valid }
    end

    context 'no email address' do
      let(:email) { ' ' }
      it { should_not be_valid }
    end

    context 'invalid email address' do
      let(:email) { 'hello@best' }
      it { should_not be_valid }
    end

    context '2 users with same email address differing in case' do
      it 'dup user is not valid' do
        dup_user = subject.dup
        dup_user.email = subject.email.upcase
        subject.save
        expect(dup_user.valid?).to be_falsy
      end
    end

    context '2 users with the same email address' do
      it 'dup user is not valid' do
        subject.save
        dup_user = subject.dup
        expect(dup_user.valid?).to be_falsy
      end
    end

    context 'password is invalid if shorter than 6 chars' do
      let(:password) { 'abcd' }
      let(:password_confirmation) { 'abcd' }
      it { should_not be_valid }
    end

    context 'password and password_confirmation should be the same' do
      let(:password) { 'foobar' }
      let(:password_confirmation) { 'alicebob' }
      it { should_not be_valid }
    end

    context 'valid name and email address' do
      it { should be_valid }
    end
  end
end
