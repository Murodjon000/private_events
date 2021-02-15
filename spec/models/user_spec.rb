require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'associations' do
    it { is_expected.to have_many(:events) }

    it { is_expected.to have_many(:attended_events).through(:enrollments).source(:event) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
