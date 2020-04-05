class Api::PostsController < ApplicationController
  before_action :find_post, only: [:update, :destroy, :show, :edit]

  def index
    @posts = Post.incomplete
    user_id = params["user_id"].to_i

    if user_id && User.exists?(user_id)
      return head :unauthorized unless logged_in_as?(user_id)

      user_posts_completed = @posts.where({user_id: user_id, completed: true})
      user_posts_not_completed = @posts.where({user_id: user_id, completed: false})
      other_posts_not_completed = @posts.where.not({user_id: user_id}, {completed: true})

      @posts = {user_posts: {completed: user_posts_completed, not_completed: user_posts_not_completed}, other_posts: other_posts_not_completed}
    end

    render json: @posts, include: :user
  end

  def create

    @post = Post.new(post_params.merge(user_id: logged_in_user_id))
    if @post.save
      render json: @post, status: :accepted
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @post, include: { matching_posts: { include: :user }, post_category: {}, user: {} }
  end

  def update
  end

  def destroy
  end

  # t.string :title
  # t.boolean :request_offer
  # t.string :details
  # t.datetime :date_posted
  # t.string :location
  # t.string :quantity
  # t.datetime :deadline
  # t.boolean :completed

  private

  def post_params
    params.permit(:title, :request_offer, :details, :date_posted, :location, :quantity, :deadline, :completed, :post_category_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
