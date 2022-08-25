class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])&.authenticate(params[:password]) 

    if user
      expired_time_token = Time.now.to_i + 1800
      user_infor = {
        user_id: user.id,
        email: user.email,
        name: user.name
      }
      payload = {
        data: {
          user_id: user_infor,
        },
        exp: expired_time_token
      }

      token = EncodeToken.new(payload).call
      render json: { access_token: token,  user_infor: user_infor}
    else
      render json: { error: true ,messages: 'The email or password are incorrect. Please, try again' }
    end
  end
end
