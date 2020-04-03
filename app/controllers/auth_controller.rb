class AuthController < ApplicationController

  include TokenGeneration
  include AuthCookie

  def login
    set_auth_cookie(generate_token(9))
    render json: { hello: true }
  end

  def register
    set_auth_cookie(generate_token(9))
    render json: { hello: true }
  end

end
