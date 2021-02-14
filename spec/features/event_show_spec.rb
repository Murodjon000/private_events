require 'rails_helper'

RSpec.describe 'Eventshow', type: :feature do
    let (:event) { create(:event) }
    let (:user) { create(:user) }

    before do
        feature_sign_in(user)
        visit event_path(event)
    end

    it 'should show the event details' do
        expect(page).to have_text(event.name)
    end
end