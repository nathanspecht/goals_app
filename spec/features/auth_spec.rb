require 'spec_helper'
require 'rails_helper'


feature "the signup process" do

  background do
    visit new_user_url
  end

  scenario "has a new user page" do
    expect(current_path).to_match new_user_url
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      user = build(:user)
      fill_in "Username" with: user.username
      fill_in "Password" with: user.password
      click_button "Submit"

      expect(page).to have_content(user.username)
    end

  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    user = build(:user)
    visit new_session_url
    fill_in "Username" with: user.username
    fill_in "Password" with: user.password
    click_button "Sign in"

    expect(page).to have_content(user.username)
  end
end

feature "logging out" do

  scenario "begins with logged out state" do
    visit goals_url
    expect(current_path).to_match new_session_url
  end

  scenario "doesn't show username on the homepage after logout" do
    user = build(:user)
    visit new_session_url
    fill_in "Username" with: user.username
    fill_in "Password" with: user.password
    click_button "Sign in"

    click_button "Log out"

    expect(page).to_not have_content(user.username)
  end

end
