class ApplicationController < ActionController::API
  def authorize_user!
    pattern = /^Bearer /
    header = request.authorization

    decode_token = DecodeToken.new(header.split()[1]).call

    if header&.match(pattern)
      return if decode_token

      render status: 401, json: { messages: 'Token' } 
    else
      render status: 401, json: { messages: 'No token' }
    end
  end
end
