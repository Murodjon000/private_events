require 'rails_helper'

RSpec.describe 'Eventshow', type: :feature do
  # rubocop disable:all Lint/ParenthesesAsGroupedExpression
  let (:event) { create(:event) }
  let (:user) { create(:attendee) }
  let (:enrollment) { create(:enrollment, user: user, event: event) }
  # rubocop enable:all Lint/ParenthesesAsGroupedExpression

  before do
    feature_sign_in(user)
    visit event_path(event)
  end

  it 'should show the event name' do
    expect(page).to have_text(event.name)
  end

  it 'should show the event date' do
    expect(page).to have_text(event.date)
  end

  it 'should show the event description' do
    expect(page).to have_text(event.description)
  end
end
