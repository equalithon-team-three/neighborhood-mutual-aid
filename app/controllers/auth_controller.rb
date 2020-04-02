class AuthController < ApplicationController

  def login
    token = JWT.encode payload, rsa_private, 'RS256'
  end

end
