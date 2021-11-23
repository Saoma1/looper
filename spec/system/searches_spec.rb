require 'rails_helper'
require 'webdrivers'

RSpec.describe "Searches", driver: :selenium_firefox, js: true, type: :system do
  before do
    driven_by(:rack_test)
    user = FactoryBot.create(:user)
    user.confirm
    login_as(user, :scope => :user)
    driven_by :selenium_firefox
  end


  it "populate search form" do
    visit home_path
    expect(find('.home_title'))
    fill_in 'search_input', with: "Harry Potter"
    sleep(1)
    expect(find('.search_input'))
    expect(page).to have_css('#results a', :count => 10)
    fill_in 'search_input', with: "Harry Potter and the Philosopher's Stone"
    sleep(1)
    expect(first('#results > a').find('li').find('p')).to have_content("Harry Potter and the Philosopher's Stone")
  end

  # it "populate movie form" do
  #   visit search_path
  #   sleep(1)
  #   find('#home_path').click
  #   sleep(5)
  # end

end


# fill_in 'search_input', with: "Harry Potter and the Philosopher's Stone"
# sleep(1)
# first('#results > a > li > p').click.
# sleep(1)

# elem = first('#results > a')
# node = elem.native["href"]
# puts node
# first('#results > a').click
# sleep(1)
