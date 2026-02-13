require "rails_helper"

RSpec.describe "Spot management", type: :system do
  it "renders inline validation errors inside a turbo frame" do
    user = User.create!(email: "owner@example.com", password: "password", password_confirmation: "password")

    login_as user
    visit new_spot_path

    expect(page).to have_css("turbo-frame#spot_form")

    click_button "Create Spot"

    within("turbo-frame#spot_form") do
      expect(page).to have_content("can't be blank")
    end
  end

  it "creates and updates a spot via turbo streams without full page reloads" do
    user = User.create!(email: "owner@example.com", password: "password", password_confirmation: "password")

    login_as user
    visit new_spot_path

    expect(page).to have_css("turbo-frame#spot_form")

    fill_in "Name", with: "Coffee Spot"
    fill_in "City", with: "Seattle"
    fill_in "State", with: "WA"
    select "active", from: "Status"

    click_button "Create Spot"

    expect(page).to have_css("turbo-frame#spot_form")
    expect(page).to have_content("Coffee Spot")

    click_link "Coffee Spot"
    click_link "Edit"

    fill_in "Name", with: "Updated Spot"
    click_button "Update Spot"

    expect(page).to have_content("Updated Spot")
  end
end
