class AuthController < ApplicationController

  include TokenGeneration
  include AuthCookie

  def check
    if logged_in?
      render json: { authenticated: true, email: logged_in_user.email }
    else
      render json: { authenticated: false }
    end
  end

  def login
    @user = User.find_by("lower(email) = ?", params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      set_auth_cookie(generate_token(@user.id))
      render json: { authenticated: true, email: @user.email }
    else
      render json: { errors: [ "That didn't match any users we have a record of" ] }
    end
  end

  def register
    @user = User.new(auth_params)
    if @user.save
      set_auth_cookie(generate_token(@user.id))
      render json: { authenticated: true, email: @user.email }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def logout
    set_auth_cookie("")
    render json: { authenticated: false }
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

end
