module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit new_user_registration_path
      fill_in 'Name', with: name 
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign Up'
    end

    def user_sign_in(options = {})
      @user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: options[:email] || @user.email
      fill_in 'Password', with: options[:password] || @user.password
      click_button 'Sign In'
    end

    def admin_sign_in(options = {})
      @admin_user = FactoryGirl.create(:admin_user)
      visit new_user_session_path

      fill_in 'Email', with: options[:email] || @admin_user.email
      fill_in 'Password', with: options[:password] || @admin_user.password
      click_button 'Sign In'
    end

    def set_category
      @category = FactoryGirl.create(:category)
    end

    def create_quizz
      set_category
      @quizz1     = FactoryGirl.create(:quizz_with_qsts)
      @questions  = @quizz1.questions.inject({}){ |hash, quest| hash[quest.id] = quest.title; hash }
      @answers    = @quizz1.questions.map{|q| q.answers.inject({}){ |hash, answ| hash[answ.id] = answ.title; hash } }
    end
  end
end