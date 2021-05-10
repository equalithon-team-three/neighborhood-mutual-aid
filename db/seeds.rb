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

Tag.destroy_all
Taggability.destroy_all
Post.destroy_all
TagCategory.destroy_all
User.destroy_all
PostCategory.destroy_all

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

mere = User.create!(first_name: "Meredith", last_name: "Strickland", email: "mere@traid.com", password: "iwashmyhandsfor20seconds!")
jess = User.create!(first_name: "Jessica", last_name: "Lin", email:"jess@traid.com", password: "iwashmyhandsfor20seconds!")
graham = User.create!(first_name: "Meredith", last_name: "Strickland", email: "graham@traid.com", password: "iwashmyhandsfor20seconds!")
tal = User.create!(first_name: "Tal", last_name: "luigi", email:"tal@traid.com", password: "iwashmyhandsfor20seconds!")
sylwia = User.create!(first_name: "Sylwia", last_name: "Lin", email:"sylwia@traid.com", password: "iwashmyhandsfor20seconds!")
rae = User.create!(first_name: "Rae", last_name: "Hochwald", email:"rae@traid.com", password: "iwashmyhandsfor20seconds!")


ppe = PostCategory.create!(name: "Personal protective equipment")
ppe.tag_categories << ppe_type

volunteering = PostCategory.create!(name: "Institutional volunteer opportunities")
volunteering.tag_categories << skills

errands = PostCategory.create!(name: "Errands")
errands.tag_categories << errand_type
errands.tag_categories << payment # Here we might want a "no payment needed" option but that doesn't make sense elsewhere this tag category is used

chatroulette = PostCategory.create!(name: "Chat with a new friend")
chatroulette.tag_categories << topics

tech_support = PostCategory.create!(name: "Help using video call software")
tech_support.tag_categories << video_call_software

financial_assistance = PostCategory.create!(name: "Financial assistance")
financial_assistance.tag_categories << payment

# financial_help = PostCategory.create!(name: "Financial advice")

misc = PostCategory.create!(name: "Miscellaneous")


posts = []

PostCategory.all.each do |post_category|
    5.times do

        if [true, false].sample
            posts << Post.new(user: User.all.sample, request_offer: true, post_category: post_category,
                    title: "I #{ ["can", "could"].sample } #{ ["definitely", "", "certainly"].sample } use some help!",
                    details: "I #{ ["can", "could"].sample } #{ ["definitely", "", "certainly"].sample } use some help with #{ post_category.name.downcase }, if you would be so kind")

        else
            posts << Post.new(user: User.all.sample, request_offer: false, post_category: post_category,
                    title: "#{ ["Can", "Could", "Might"].sample } I help you #{ [true, false].sample ? " out" : "" }?",
                    details: "I #{ ["would love to", "would like to", "can", "could",].sample } help you out with #{ post_category.name.downcase }, if you need some assistance")
        end
    end
end

posts.shuffle.each { |post| post.save! }
