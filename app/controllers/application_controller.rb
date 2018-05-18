class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception

  before_action :verify_token

  skip_before_action :verify_authenticity_token

  private

  def verify_token
    invalid = User.where(auth_token: request.headers['AuthToken']).blank?
    raise 'Invalid Request' if invalid
  end

end