module AuthCookie

  def set_auth_cookie(payload)
    response.set_cookie(:auth_token,
      {
        value: payload,
        expires: 7.days.from_now,
        path: '/api',
        httponly: true
      }
    )
  end

end