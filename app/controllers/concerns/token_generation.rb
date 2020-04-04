module TokenGeneration

  extend ActiveSupport::Concern

  def generate_token(user_id)
    JWT.encode({ user_id: user_id }, private_key, 'RS256')
  end

  private

  def private_key
    OpenSSL::PKey::RSA.new ENV['TOKEN_PRIVATE_KEY']
  end


  # Ok so this will error out pretty bad in local development unless you do this:
  #
  # 1. Create a .env file and put it in the root directory of this Rails app.
  # 2. Define 2 keys in that file, like so:
  #
  # TOKEN_PUBLIC_KEY="-----BEGIN PUBLIC KEY-----\nwhateverwhateverwhateverwhateverwhatever\n-----END PUBLIC KEY-----\n"
  # TOKEN_PRIVATE_KEY="-----BEGIN RSA PRIVATE KEY-----\nwhateverwhateverwhateverwhateverwhateverwhatever\n-----END RSA PRIVATE KEY-----\n"
  #
  # 3. Actually generate these keys, like this:
  #
  # rsa_private = OpenSSL::PKey::RSA.generate(2048).to_s
  # rsa_public = rsa_private.public_key.to_s
  #
  # 4. Then puttem in the .env file.
  # 5. That's it
  
end