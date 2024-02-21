# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin_user = User.create!(
  first_name: "Admin",
  last_name: "User",
  email: "admin@example.com",
  complete_address: "Admin Address",
  province: "Samar",
  city_municipality: "Santo Niño",
  contact_number: "01234567890",
  barangay: "Ilijan",
  role: :admin,
  status: :approved,
  password: "adminpassword",
  password_confirmation: "adminpassword"
)

User.create!(
  first_name: "Jose",
  last_name: "Reyes",
  email: "jose@reyes.com",
  complete_address: "123 Village 4, Brgy. Ilijan, Sto. Nino, Samar",
  province: "Samar",
  city_municipality: "Santo Niño",
  contact_number: "09060000000",
  barangay: "Ilijan",
  role: :resident,
  status: :approved,
  password: "password",
  password_confirmation: "password"
)

User.create!(
  first_name: "Josefa",
  last_name: "Reyes",
  email: "josefa@reyes.com",
  complete_address: "124 Village 4, Brgy. Ilijan, Sto. Nino, Samar",
  province: "Samar",
  city_municipality: "Santo Niño",
  contact_number: "09060000001",
  barangay: "Ilijan",
  role: :resident,
  status: :pending,
  password: "password",
  password_confirmation: "password"
)

User.create!(
  first_name: "Joseph",
  last_name: "Reyes",
  email: "joseph@reyes.com",
  complete_address: "124 Village 4, Brgy. Banlic, Calamba, Laguna",
  province: "Laguna",
  city_municipality: "City of Calamba",
  contact_number: "09060000002",
  barangay: "Banlic",
  role: :resident,
  status: :pending,
  password: "password",
  password_confirmation: "password"
)

User.create!(
  first_name: "Admin",
  last_name: "Banlic",
  email: "admin@banlic.com",
  complete_address: "Brgy Hall",
  province: "Laguna",
  city_municipality: "City of Calamba",
  contact_number: "09060000003",
  barangay: "Banlic",
  role: :admin,
  status: :approved,
  password: "admin123",
  password_confirmation: "admin123"
)