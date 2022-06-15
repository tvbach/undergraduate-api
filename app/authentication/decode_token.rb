class DecodeToken
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def call
    public_key = OpenSSL::PKey::RSA.new(File.read 'key.pem').public_key
    JWT.decode token, public_key, true, { algorithm: 'RS256' }
  rescue JWT::ExpiredSignature
    render status: 401, json: { messages: 'Token expired' }
  end
end
