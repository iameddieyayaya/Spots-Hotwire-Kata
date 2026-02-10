require "rails_helper"

RSpec.describe "Filter panel", type: :system, js: true do
  it "toggles the filter panel with Stimulus" do
    user = User.create!(email: "owner3@example.com", password: "password", password_confirmation: "password")
    Spot.create!(
      user: user,
      name: "Trailhead",
      description: "",
      city: "Boulder",
      state: "CO",
      status: "active"
    )

    visit spots_path

    expect(page).to have_css("[data-toggle-target='panel'].hidden")
    click_button "Filters"
    expect(page).not_to have_css("[data-toggle-target='panel'].hidden")
  end
end
