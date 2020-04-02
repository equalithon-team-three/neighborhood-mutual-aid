class Api::UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]


  def index
    @user = User.all 
    render json: @users 
  end 

  def new
    @user = User.new 
  end 

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user, status: :accepted
  end 

  def show 
    render json: @user 
  end 

  def edit 
    render json: @user
  end 

  def update 
    @user.update(user_params)
    if @user.save 
      render json: @user, status: :accepted 
    else 
      render json: {error: 'Could not update user'}
    end
  end 

  def destroy 
    @user.destroy 
    render json: {message: 'User deleted'}
  end 


  private

  def user_params 
    params.require(:first_name, :last_name).permit(:email)
  end 

  def find_user 
    @user = User.find(params[:id])
  end 

end