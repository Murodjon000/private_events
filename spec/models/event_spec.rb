require 'rails_helper'

RSpec.describe Event, type: :model do
    subject(:event) { build(:event) }

  describe 'associations' do
    it { is_expected.to belong_to(:creator).class_name('User') }

    it { is_expected.to have_many(:attendees).through(:enrollments).source(:user) }
  end
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:date) }
  end

  describe '::past' do
    it 'should list all past events' do
      past_event = create(:event, :past)
      create(:event, :upcoming)

      expect(Event.past.map(&:id)).to match_array([past_event.id])
    end
  end

  describe '::upcoming' do
    it 'should list all upcoming events' do
      upcoming_event = create(:event, :upcoming)
      create(:event, :past)
      
      expect(Event.upcoming.map(&:id)).to match_array([upcoming_event.id])
    end
  end

end
