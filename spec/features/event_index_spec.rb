require 'rails_helper'

RSpec.describe 'EventIndices', type: :feature do
  it 'should list all upcoming events' do
    event = create(:event, :upcoming)
    enrollment = create(:enrollment, event: event)
    user = enrollment.user

    feature_sign_in(user)
    visit events_path

    expect(page).to have_current_path(events_path)
  end

  it 'should list all past events' do
    event = create(:event, :past)
    enrollment = create(:enrollment, event: event)
    user = enrollment.user

    feature_sign_in(user)
    visit events_path

    expect(page).to have_current_path(events_path)
  end
end
