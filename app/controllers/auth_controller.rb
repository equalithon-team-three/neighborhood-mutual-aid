class AuthController < ApplicationController
  include TokenGeneration
  include AuthCookie

  def check
    if logged_in?
      render json: {
        authenticated: true,
        id: logged_in_user.id,
        google_id: logged_in_user.google_id,
        email: logged_in_user.email,
        first_name: logged_in_user.first_name,
        last_name: logged_in_user.last_name,
        full_name: logged_in_user.full_name,
        img_url: logged_in_user.img_url
      }
    else
      render json: { authenticated: false }
    end
  end

  def login
    @user = User.find_by("lower(email) = ?", params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      set_auth_cookie(generate_token(@user.id))
      render json: {
        authenticated: true,
        id: @user.id,
        google_id: @user.google_id,
        email: @user.email,
        first_name: @user.first_name,
        last_name: @user.last_name,
        full_name: @user.full_name,
        img_url: @user.img_url
      }
    else
      render json: { errors: [ "That didn't match any users we have a record of" ] }
    end
  end

  def register
    @user = User.new(auth_params)
    if @user.save
      set_auth_cookie(generate_token(@user.id))
      render json: {
        authenticated: true,
        id: @user.id,
        google_id: @user.google_id,
        email: @user.email,
        first_name: @user.first_name,
        last_name: @user.last_name,
        full_name: @user.first_name ? "#{@user.first_name} #{ @user.last_name}" : nil,
        img_url: @user.img_url
      }
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
      @user.update!(
        google_id: request.env['omniauth.auth']['uid'],
        email: request.env['omniauth.auth']['info']['email'],
        first_name: request.env['omniauth.auth']['info']['first_name'],
        last_name: request.env['omniauth.auth']['info']['last_name'],
        full_name: request.env['omniauth.auth']['info']['name'],
        img_url: request.env['omniauth.auth']['info']['image'],
        password: SecureRandom.uuid,
      )
    end

    set_auth_cookie(generate_token(@user.id))
    redirect_to ENV['ROOT_URL']
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
