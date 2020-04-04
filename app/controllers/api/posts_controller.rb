class Api::PostsController < ApplicationController
  before_action :find_post, only: [:update, :destroy, :show, :edit]

  def index
    @posts = Post.uncompleted
    user_id = params["user_id"].to_i

    if user_id && User.exists? user_id 
      return head :unauthorized unless logged_in_as? user_id

      user_posts = logged_in_user.posts # tal this will include completed and uncompleted, but you can use the scope to filter I think
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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    render json: @post, status: :accepted
  end

  def show
    render json: @post
  end

  def edit
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
    params.require(:user_id).permit(:title, :request_offer, :details, :date_posted, :location, :quantity, :deadline, :completed)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
