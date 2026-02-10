require "rails_helper"

RSpec.describe "Spots pagination and search", type: :system do
  it "scopes results with search and paginates inside a turbo frame" do
    user = User.create!(email: "owner2@example.com", password: "password", password_confirmation: "password")

    8.times do |i|
      Spot.create!(
        user: user,
        name: "Loft #{i}",
        description: "",
        city: "Seattle",
        state: "WA",
        status: "active"
      )
    end

    Spot.create!(
      user: user,
      name: "Desert Camp",
      description: "",
      city: "Phoenix",
      state: "AZ",
      status: "active"
    )

    visit spots_path(query: "Loft")

    expect(page).to have_css("turbo-frame#spots_list")
    expect(page).to have_content("Loft 0")
    expect(page).not_to have_content("Desert Camp")
  end
end
