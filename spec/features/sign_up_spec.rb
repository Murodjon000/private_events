require 'rails_helper'

RSpec.describe 'Signups', type: :feature do
    it 'should redirect to root_path after sign up' do
        visit new_user_path
        fill_in 'Name', with: 'Uduak John'
        click_button 'Create my account'

        expect(page).to have_current_path(root_path)
    end

    it 'should show notification after sign up' do
        visit new_user_path
        fill_in 'Name', with: 'Uduak John'
        click_button 'Create my account'
    
        expect(page).to have_text('You successfuly signed up')
    end

    it 'should render action after error' do
        visit new_user_path
        fill_in 'Name', with: ''
        click_button 'Create my account'
    
        expect(page).to have_text('be blank')
    end
end