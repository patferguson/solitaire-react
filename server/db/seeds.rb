# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Only create an admin user for local development environments to speed up setup
# TODO: Consider adding a version of this command for :production that pulls this default initial admin user password from an environment variable to speed up production setup?
if Rails.env.to_sym == :development
  #User.create!(display_name: "Admin", name: "Admin User", email: "admin@example.com", is_admin: true, password: "Admin123", password_confirmation: "Admin123")
end
