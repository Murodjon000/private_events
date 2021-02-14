require 'rails_helper'

RSpec.describe 'Signins', type: :feature do
    it 'should redirect to root_path after sign in' do
        user = create(:user)
        visit new_session_path
        fill_in 'Name', with: user.name
        click_button 'Log in'

        expect(page).to have_current_path(root_path)
    end

    it 'should show notification after sign up' do
        user = create(:user)
        visit new_session_path
        fill_in 'Name', with: user.name
        click_button 'Log in'
    
        expect(page).to have_text('You successfuly logged in')
    end
end