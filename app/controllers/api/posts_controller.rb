class Api::PostsController < ApplicationController
  before_action :find_post, only: [:update, :destroy, :show, :edit]

  def index
    @posts = Post.all
    user_id = params["user_id"].to_i

    if User.exists? user_id
      user_posts = @posts.where user_id: user_id
      other_posts = @posts.where.not user_id: user_id
      @posts = {user_posts: user_posts, other_posts: other_posts}

      # # Single db ping approach:
      # @posts = @posts.reduce({user_posts: [], other_posts: []}) {|acc, cur_post|
      #   if cur_post["user_id"] == user_id
      #     acc[:user_posts].push(cur_post)
      #   else
      #     acc[:other_posts].push(cur_post)
      #   end

      #   acc
      # }
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
    render json: @post
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
