require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  subject(:enrollment) { build(:enrollment) }

  describe 'associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to belong_to(:event) }
  end
end