require 'rails_helper'

RSpec.describe Employment, type: :model do

  describe 'validations' do
    subject(:employment) { FactoryBot.build(:employment) }

    context 'without employer' do
      before { employment.employer = nil }
      it { is_expected.not_to be_valid }
    end

    context 'without start date' do
      before { employment.date_started = nil }
      it { is_expected.not_to be_valid }
    end

    context 'without end date' do
      before { employment.date_ended = nil }
      it { is_expected.not_to be_valid }
    end
  end
end
