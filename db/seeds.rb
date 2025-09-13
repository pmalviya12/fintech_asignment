# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
<<<<<<< HEAD
=======


# Organizations
tesla = Organization.create!(name: "Tesla Inc.", email: "investor@tesla.com")
apple = Organization.create!(name: "Apple Corp.", email: "hello@apple.com")
microsoft = Organization.create!(name: "Microsoft Ltd.", email: "info@microsoft.com")

# Contacts + portfolios
john = Contact.create!(name: "John Carter", email: "john.carter@tesla.com", organization: tesla)
john.portfolios.create!(name: "EV Growth Fund", balance: 12000.50, performance: 14.3)
john.portfolios.create!(name: "Battery Index", balance: 8500.00, performance: -1.7)

emma = Contact.create!(name: "Emma Watson", email: "emma@apple.com", organization: apple)
emma.portfolios.create!(name: "Tech Innovation Fund", balance: 25000.00, performance: 9.8)
emma.portfolios.create!(name: "Global Bonds", balance: 6000.75, performance: 2.5)

michael = Contact.create!(name: "Michael Brown", email: "m.brown@microsoft.com", organization: microsoft)
michael.portfolios.create!(name: "Cloud Services Equity", balance: 18000.25, performance: 11.2)
michael.portfolios.create!(name: "Dividend Fund", balance: 9500.00, performance: 4.1)

# Email templates
EmailTemplate.create!(
  subject: "Monthly Portfolio Update",
  body: <<~BODY
    Hi {Contact.name},

    Here’s your portfolio summary from {Organization.name}:

    Best performing portfolio: {Portfolio.best_performance}%  
    Worst performing portfolio: {Portfolio.worst_performance}%

    Stay invested,  
    Your Advisory Team
  BODY
)

EmailTemplate.create!(
  subject: "Welcome to {Organization.name}, {Contact.name}",
  body: <<~BODY
    Hello {Contact.name},

    Welcome aboard at {Organization.name}!  
    We're thrilled to have you with us.

    Best regards,  
    Client Success Team
  BODY
)

puts "Seeded: Organizations #{Organization.count}, Contacts #{Contact.count}, Portfolios #{Portfolio.count}, Templates #{EmailTemplate.count}"
>>>>>>> f006700 (Initial clean commit)
