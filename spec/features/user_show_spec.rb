require 'rails_helper'

RSpec.describe 'Usershow page', type: :feature do
  it 'should list all user events' do
    enrollment = create(:enrollment)
    user = enrollment.user
    event = enrollment.event
    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end

  it 'should list all upcoming events' do
    event = create(:event, :upcoming)
    enrollment = create(:enrollment, event: event)
    user = enrollment.user

    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end

  it 'should list all past events' do
    event = create(:event, :past)
    enrollment = create(:enrollment, event: event)
    user = enrollment.user

    feature_sign_in(user)
    visit user_path(user)

    expect(page).to have_link(event.name, href: event_path(event))
  end
end
