require 'rails_helper'

RSpec.describe PersonalData, type: :model do
  describe 'validations' do
    subject(:personal_data) { FactoryBot.build(:personal_data) }
    # subject { FactoryBot.build(:personal_data) }

    context 'without first name' do
      before { personal_data.first_name = nil }
      it { is_expected.not_to be_valid }
    end
    context 'without last name' do
      before { personal_data.last_name = nil }
      it { is_expected.not_to be_valid }
    end
    context 'without email' do
      before { personal_data.email = nil }
      it { is_expected.not_to be_valid }
    end
    context 'when email is a duplicate' do
      before { FactoryBot.create(:personal_data, email: personal_data.email) }
      it { is_expected.not_to be_valid }
    end
    context 'without phone' do
      before { personal_data.phone = nil }
      it { is_expected.not_to be_valid }
    end
    context 'when first name is greater than 25 characters' do
      before { personal_data.first_name = Faker::Lorem.characters(number: 30) }
      it { is_expected.not_to be_valid }
    end

    context 'when last name is greater than 50 characters' do
      before { personal_data.last_name = Faker::Lorem.characters(number: 55) }
      it { is_expected.not_to be_valid }
    end
  end
end
