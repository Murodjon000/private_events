require 'rails_helper'

RSpec.describe 'Eventnew', type: :feature do
  # rubocop disable:all Lint/ParenthesesAsGroupedExpression   
  let (:user) { create(:user) }
  # rubocop enable:all Lint/ParenthesesAsGroupedExpression
  before do
    feature_sign_in(user)
    visit new_event_path
    fill_in 'Name', with: 'Cocke Part'
    fill_in 'Description', with: 'Hello Guys of Uzbekistan.'
    click_button 'Create new event'
  end

  it 'should redirect to event page after creating' do
    expect(page).to have_current_path(event_path(Event.first.id))
  end

  it 'should have success message after creating' do
    expect(page).to have_text('Event successfuly created')
  end
end
