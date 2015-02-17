module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit new_user_registration_path
      fill_in 'Name', with: name 
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    def user_sign_in(options = {})
      @user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: options[:email] || @user.email
      fill_in 'Password', with: options[:password] || @user.password
      click_button 'Sign in'
    end

    def admin_sign_in(options = {})
      @admin_user = FactoryGirl.create(:admin_user)
      visit new_user_session_path

      fill_in 'Email', with: options[:email] || @admin_user.email
      fill_in 'Password', with: options[:password] || @admin_user.password
      click_button 'Sign in'
    end

    def set_category
      @category = FactoryGirl.create(:category)
    end
  end
end