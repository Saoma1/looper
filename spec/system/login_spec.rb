require 'rails_helper'

RSpec.describe "Login", type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user)
  end
  it "login with username and password" do
    visit '/users/sign_in'
    fill_in 'user_login', with: 'Mike'
    fill_in 'user_password', with: '111111'
    click_button 'login'
    expect(page).to have_content 'Signed in successfully.'
  end
end
