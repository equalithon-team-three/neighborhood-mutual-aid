class ApplicationController < ActionController::API
  include TokenDecoding

  private

  def logged_in?
    !!logged_in_user_id
  end

  def logged_in_as? user_id
    logged_in_user_id == user_id
  end

  def logged_in_user_id
    decode_token request.cookies["auth_token"]
  end

  def logged_in_user
    @user ||= User.find(logged_in_user_id) if logged_in?
  end
end
