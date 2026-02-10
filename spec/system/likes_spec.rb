require "rails_helper"

RSpec.describe "Spot likes", type: :system, js: true do
  it "toggles the like button and count inside turbo frames" do
    user = User.create!(email: "fan@example.com", password: "password", password_confirmation: "password")
    spot = Spot.create!(
      user: user,
      name: "River Walk",
      description: "",
      city: "Nashville",
      state: "TN",
      status: "active"
    )

    login_as user
    visit spot_path(spot)

    expect(page).to have_css("turbo-frame#like_button")
    expect(page).to have_css("turbo-frame#like_count")

    within("turbo-frame#like_button") do
      click_button "Like"
    end

    within("turbo-frame#like_count") do
      expect(page).to have_content("1")
    end
  end
end
