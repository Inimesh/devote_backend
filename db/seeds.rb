# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# seed transactions to round_up to the nearest integer max 0.49, 23.51 create 0.49 round_up
# when user available:
  # find all users: users = User.all
    # loop users
      # for each user create 1 or more transactions and plug the user.id
vendors = {
  small: ["Starbucks", "Hipster Bar", "The Pub", "Tesco Express"],
  medium: ["Sainsburys", "M&S", "Waitrose", "Argos", "Pizza Pilgrims"],
  large: ["Amazon", "John Lewis", "Currys", "Asos", "Selfridges"]
}

user1 = User.new(username: "John Smith", email: "johnsmith@mail.com", password: "password", password_confirmation: "password")
user2 = User.new(username: "Mary Williams", email: "marywilliams@mail.com", password: "password", password_confirmation: "password")
user1.save
user2.save

users = User.all

users.each do |user|
  5.times do
    transaction = Transaction.new(amount: BigDecimal(Faker::Commerce.price(range: 5.0..200.0, as_string: true)), user_id: user.id)
    round_up = BigDecimal(transaction.amount.ceil.to_s) - transaction.amount
    round_up = nil if round_up <= 0
    transaction.round_up = round_up
    if transaction.amount <= 35
      transaction.name = vendors[:small].sample
    elsif transaction.amount > 35 && transaction.amount <= 110
      transaction.name = vendors[:medium].sample
    else
      transaction.name = vendors[:large].sample
    end

    transaction.save
  end
end


