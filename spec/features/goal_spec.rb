require 'spec_helper'
require 'rails_helper'

feature "goal creation" do
  scenario "can create new goal" do
    user = create(:user)
    sign_in(user)

    goal = build(:goal)

    visit new_goal_url

    fill_in "Goal", with: goal.title
    fill_in "Description", with: goal.description

    click_button "Add goal"

    expect(page).to have_content goal.title
    expect(current_url).to match goals_url
  end
end

feature "goal editing" do
  scenario "can edit a goal" do
    user = create(:user)
    sign_in(user)
    goal = create(:goal, user_id: user.id)
    visit goal_url(goal)
    click_link "Edit goal"
    expect(current_url).to match edit_goal_url(goal)

    fill_in "Goal", with: "Editted goal"

    click_button "Update goal"

    expect(page).to have_content "Editted goal"
    expect(current_url).to match goals_url
  end
end
