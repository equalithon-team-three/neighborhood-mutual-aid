class Api::PostsController < ApplicationController
  before_action :find_post, only: [:update, :destroy, :show, :edit]

  def index
    @posts = Post.all 
    render json: @posts
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
