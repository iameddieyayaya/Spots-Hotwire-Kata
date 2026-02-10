# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
demo_user = User.find_or_create_by!(email: "demo@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

owner = User.find_or_create_by!(email: "owner@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

spots = [
  { name: "Civic Loft", description: "Bright, open loft for weekend work sessions.", city: "Seattle", state: "WA", status: "active", user: owner },
  { name: "North Shore Trail", description: "Scenic loop with river views.", city: "Portland", state: "OR", status: "active", user: owner },
  { name: "Sunset Market", description: "Late-night bites and live music.", city: "Austin", state: "TX", status: "draft", user: demo_user },
  { name: "Ridgeline Camp", description: "Quiet camp spot with sunrise views.", city: "Denver", state: "CO", status: "active", user: demo_user },
  { name: "Downtown Studio", description: "Minimal studio for creative sprints.", city: "Chicago", state: "IL", status: "archived", user: owner }
]

spots.each do |attrs|
  spot = Spot.find_or_create_by!(name: attrs[:name]) do |record|
    record.assign_attributes(attrs)
  end

  Comment.find_or_create_by!(spot: spot, user: demo_user, body: "Love this idea!")
  Comment.find_or_create_by!(spot: spot, user: owner, body: "Adding more details soon.")
end

Spot.limit(2).each do |spot|
  Like.find_or_create_by!(spot: spot, user: demo_user)
end
