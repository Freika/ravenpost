describe 'Users' do
  describe 'registration' do
    it 'failed if no first name provided' do
      visit new_user_registration_path

      fill_in 'Last name', with: 'Bill'
      fill_in 'Email', with: 'bill@gates.com'
      fill_in 'Password', with: '00000000'
      fill_in 'Password confirmation', with: '00000000'

      click_button 'Sign up'

      expect(page).to have_content "First name can't be blank"
    end

    it 'failed if no last name provided' do
      visit new_user_registration_path

      fill_in 'First name', with: 'Gates'
      fill_in 'Email', with: 'bill@gates.com'
      fill_in 'Password', with: '00000000'
      fill_in 'Password confirmation', with: '00000000'

      click_button 'Sign up'

      expect(page).to have_content "Last name can't be blank"
    end
  end
end
