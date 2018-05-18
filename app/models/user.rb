class User < ApplicationRecord

  before_save :update_auth_token

  def  update_auth_token
    self.auth_token = Digest::MD5.hexdigest(email)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.dig('provider')
      user.uid = auth.dig('uid')
      user.email = auth.dig('info', 'email')
      user.firstname = auth.dig('info', 'first_name')
      user.lastname = auth.dig('info', 'last_name')
      user.name = auth.dig('info', 'name')
      user.oauth_token = auth.dig('credentials', 'token')
      user.oauth_expires_at = Time.at(auth.dig('credentials', 'expires_at'))
      user.save!
    end
  end
end