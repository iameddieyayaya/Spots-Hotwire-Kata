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
end
