module TokenDecoding

  extend ActiveSupport::Concern

  def decode_token token
    begin
      decoded = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }
      decoded.first["user_id"]
    rescue JWT::DecodeError, JWT::VerificationError => e
      nil
    end
  end

  private

  def rsa_public
    OpenSSL::PKey::RSA.new ENV['TOKEN_PUBLIC_KEY']
  end


  # Ok so this will error out pretty bad in local development unless you do this:
  #
  # see TokenGeneration for details
  
end