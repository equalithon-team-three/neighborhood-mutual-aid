# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
      # t.string :first_name
      # t.string :last_name
      # t.string :email

# Post
    # t.string "title"
    # t.boolean "request_offer"
    # t.string "details"
    # t.datetime "date_posted"
    # t.string "location"
    # t.string "quantity"
    # t.datetime "deadline"
    # t.boolean "completed"
    # t.bigint "user_id"
    # t.datetime "created_at", precision: 6, null: false
    # t.datetime "updated_at", precision: 6, null: false
    # t.index ["user_id"], name: "index_posts_on_user_id"

# Post.delete_all
# User.delete_all

User.create(first_name: "Meredith", last_name: "Strickland", email: "123@traid.com")
User.create(first_name: "Jessica", last_name: "Lin", email:"jess@traid.com")

Post.create(title: 'Something', request_offer: true, details:'more', user_id: 1)
Post.create(title: 'Test2', request_offer: true, details:'other', user_id: 2)
