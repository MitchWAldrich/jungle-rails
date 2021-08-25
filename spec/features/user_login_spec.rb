require 'rails_helper'

RSpec.feature "User can login", type: :feature, js: true do

  scenario "They enter their credentials and are authenticated." do
    user = User.create!(firstname: 'Jen', lastname: 'Krabbe', email: 'jen@email.com', password: 'password', password_confirmation: 'password')
    
    visit root_path
    
    click_link('Login')
    sleep(5)

    page.fill_in 'email', with: 'jen@email.com'
    page.fill_in 'password', with: 'password'
    
    find('.btn-success').click
   
    expect(page).to have_text 'Logout'
  end

end
