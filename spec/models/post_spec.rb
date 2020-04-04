require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "#matching_posts" do

    it "returns posts in the same category, but not the one called on" do
      romy = User.create!(email: "romy@highschool.edu", password: "businesswoman'special")
      michelle = User.create!(email: "michelle@highschool.edu", password: "businesswoman'special")

      foo = PostCategory.create!(name: "Foo")
      bar = PostCategory.create!(name: "Bar")

      post_foo = Post.create!(post_category: foo, title: "Test", details: "Test", user: romy, request_offer: true)
      post_foo2 = Post.create!(post_category: foo, title: "Test", details: "Test", user: michelle, request_offer: false)
      post_bar = Post.create!(post_category: bar, title: "Test", details: "Test", user: romy, request_offer: false)

      expect(post_foo.matching_posts).to match([ post_foo2, post_bar ])
    end
  end

  before(:all) do
    Post.destroy_all
    User.destroy_all
    PostCategory.destroy_all
  end
end
