require 'spec_helper'
require 'rails_helper'


feature "the signup process" do

  background do
    visit new_user_url
  end

  scenario "has a new user page" do
    expect(current_url).to match new_user_url
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      user = build(:user)
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      click_button "Submit"

      expect(page).to have_content(user.username)
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    user = create(:user)
    sign_in(user)

    expect(page).to have_content(user.username)
  end
end

feature "logging out" do

  scenario "begins with logged out state" do
    visit goals_url
    expect(current_url).to match new_session_url
  end

  scenario "doesn't show username on the homepage after logout" do
    user = create(:user)
    sign_in(user)
    click_button "Log out"

    expect(page).to_not have_content(user.username)
  end

end
