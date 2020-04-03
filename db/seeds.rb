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


# User.create(first_name: "Meredith", last_name: "Strickland", email: "123@traid.com", password: "iwashmyhandsfor20seconds!")
# User.create(first_name: "Jessica", last_name: "Lin", email:"jess@traid.com", password: "iwashmyhandsfor20seconds!")
# =======

ppe_type = TagCategory.create!(name: "Type of personal protective equipment")

handmade_masks = Tag.create!(name: "Masks (handmade)", tag_category: ppe_type)
Tag.create!(name: "Masks (certified n95)", tag_category: ppe_type)
Tag.create!(name: "Masks (certified surgical)", tag_category: ppe_type)
Tag.create!(name: "Gloves", tag_category: ppe_type)
Tag.create!(name: "Face shield (handmade)", tag_category: ppe_type)

skills = TagCategory.create!(name: "Skills")

Tag.create!(name: "Phlebotomy", tag_category: skills)
Tag.create!(name: "Web Development", tag_category: skills)

language = TagCategory.create!(name: "Language")

Tag.create!(name: "Pig Latin", tag_category: language)
Tag.create!(name: "Esperanto", tag_category: language)

payment = TagCategory.create!(name: "Payment Type")

Tag.create!(name: "Venmo", tag_category: payment)
Tag.create!(name: "Cash App", tag_category: payment)

topics = TagCategory.create!(name: "Topics")

Tag.create!(name: "Sports", tag_category: topics)
Tag.create!(name: "Arts", tag_category: topics)

video_call_software = TagCategory.create!(name: "Video Call Software")

Tag.create!(name: "FaceTime", tag_category: video_call_software)
Tag.create!(name: "Zoom", tag_category: video_call_software)
Tag.create!(name: "Skype", tag_category: video_call_software)
Tag.create!(name: "Google Hangouts", tag_category: video_call_software)

errand_type = TagCategory.create!(name: "Errand Type")

shopping = Tag.create!(name: "Grocery shopping", tag_category: errand_type)
Tag.create!(name: "Prescription pick-up", tag_category: errand_type)

mere = User.create!(first_name: "Meredith", last_name: "Strickland", email: "123@traid.com")
jessica = User.create!(first_name: "Jessica", last_name: "Lin", email:"jess@traid.com")

ppe = PostCategory.create!(name: "Personal protective equipment")
ppe.tag_categories << ppe_type

volunteering = PostCategory.create!(name: "Institutional volunteer opportunities")
volunteering.tag_categories << skills

errands = PostCategory.create!(name: "Errands")
errands.tag_categories << errand_type
errands.tag_categories << payment # here we might want a "no payment needed" option but that doesn't make sense elsewhere this tag category is used

chatroulette = PostCategory.create!(name: "Chat with a new friend")
chatroulette.tag_categories << topics

tech_support = PostCategory.create!(name: "Help using video call software")
tech_support.tag_categories << video_call_software

financial_assistance = PostCategory.create!(name: "Financial assistance")
financial_assistance.tag_categories << payment

# ????
#financial_help = PostCategory.create!(name: "Financial advice")

misc = PostCategory.create!(name: "Miscellaneous")

something = Post.create!(title: 'Something', request_offer: true, details:'more', user_id: mere.id, post_category_id: ppe.id)
something.tags << handmade_masks

test2 = Post.create!(title: 'Test2', request_offer: true, details:'other', user_id: jessica.id, post_category_id: errands.id)
test2.tags << shopping




