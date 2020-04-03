class Api::UsersController < ApplicationController
  before_action :find_user, only: %i[show update destroy]

  def index
    @user = User.all 
    render json: @users 
  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }
    end
  end 

  def show 
    render json: @user 
  end 

  def update 
    @user.update(user_params)
    if @user.save 
      render json: @user, status: :accepted 
    else 
      render json: { errors: @user.errors.full_messages }
    end
  end 

  def destroy 
    @user.destroy 
    render json: { message: 'User deleted' }
  end 


  private

  def user_params 
    params.require(:first_name, :last_name).permit(:email)
  end 

  def find_user 
    @user = User.find(params[:id])
  end 

end