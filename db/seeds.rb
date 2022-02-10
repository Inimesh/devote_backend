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
transaction = Transaction.new(amount: Faker::Number.decimal(l_digits: 2))
round_up = BigDecimal(transaction.amount.ceil.to_s) - transaction.amount
round_up = nil if round_up <= 0 || round_up >= 0.50
transaction.round_up = round_up
transaction.save