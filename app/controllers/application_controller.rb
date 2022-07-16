class ApplicationController < ActionController::API
  before_action :authorize_user!

  attr_reader :current_user

  def authorize_user!
    pattern = /^Bearer /
    header = request.authorization

    @current_user = DecodeToken.new(header.split()[1]).call

    if header&.match(pattern)
      return if @current_user

      render status: 401, json: { messages: 'Token' } 
    else
      render status: 401, json: { messages: 'No token' }
    end
  end
end
