class EncodeToken
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def call
    if File.exist? 'key.pem'
      private_key = OpenSSL::PKey::RSA.new File.read 'key.pem'
      JWT.encode payload, private_key, 'RS256'
    else
      render status: 401, json: { messages: 'Token expired' }
    end
  end
end
