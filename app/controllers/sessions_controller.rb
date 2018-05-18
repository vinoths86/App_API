class SessionsController < ApplicationController

  skip_before_action :verify_token, only: [:create, :verify_login]

  def verify_login
    user = User.where(login_params).first
    if user
      render json: {status: true, message: 'Login Successful', user_id: user.id, auth_token: user.auth_token}
    else
      render json: {status: false, message: 'Invalid Login Details'}
    end
  end

  def create
    user = User.from_omniauth(JSON.parse(params['data']))
    render json: {status: true, message: 'Login Successful', user_id: user.id, auth_token: user.auth_token}
  end

  private

  def login_params
    {
        email: params[:email],
        password: Digest::MD5.hexdigest(params[:password])
    }
  end

end