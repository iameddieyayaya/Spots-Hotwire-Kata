require "rails_helper"

RSpec.describe "Spot comments", type: :system, js: true do
  it "appends comments via turbo streams" do
    user = User.create!(email: "commenter@example.com", password: "password", password_confirmation: "password")
    spot = Spot.create!(
      user: user,
      name: "Lake View",
      description: "",
      city: "Madison",
      state: "WI",
      status: "active"
    )

    login_as user
    visit spot_path(spot)

    expect(page).to have_css("turbo-frame#comments")

    within("turbo-frame#comments") do
      fill_in "Comment", with: "Great spot!"
      click_button "Post comment"
      expect(page).to have_content("Great spot!")
    end
  end
end
