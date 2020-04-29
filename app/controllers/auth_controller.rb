class AuthController < ApplicationController

  include TokenGeneration
  include AuthCookie

  def check
    if logged_in?
      render json: { authenticated: true,
      id: logged_in_user.id,
      email: logged_in_user.email
    }
    else
      render json: { authenticated: false }
    end
  end

  def login
    @user = User.find_by("lower(email) = ?", params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      set_auth_cookie(generate_token(@user.id))
      render json: { authenticated: true, id: @user.id, email: @user.email }
    else
      render json: { errors: [ "That didn't match any users we have a record of" ] }
    end
  end

  def register
    @user = User.new(auth_params)
    if @user.save
      set_auth_cookie(generate_token(@user.id))
      render json: { authenticated: true, id: @user.id, email: @user.email }
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def logout
    set_auth_cookie("")
    render json: { authenticated: false }
  end

  def google_oauth2_callback

    @user = User.find_or_initialize_by(google_id: request.env['omniauth.auth']['uid'])
    unless @user.persisted? 
      @user.update!(first_name: request.env['omniauth.auth']['info']['first_name'],
                   last_name: request.env['omniauth.auth']['info']['last_name'],
                     image: request.env['omniauth.auth']['info']['image'],
                     password: SecureRandom.uuid,
                     email: request.env['omniauth.auth']['info']['email'])
    end
    set_auth_cookie(generate_token(@user.id))
    redirect_to "https://tr-aid.web.app/oauthed"
  end

  private

  def auth_params
    params.permit(:email, :password)
  end

end
