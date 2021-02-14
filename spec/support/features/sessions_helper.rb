module Features
    module SessionsHelper
      def feature_sign_in(user = nil)
        user ||= create(:user)
        visit new_session_path
        fill_in 'Name', with: user.name
        click_button 'Log in'
      end
    end
end