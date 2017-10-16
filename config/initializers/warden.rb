Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies [:httpauth, :params]
end

Warden::Manager.serialize_into_session do |user|
  user.persistence_token
end

Warden::Manager.serialize_from_session do |id|
  User.where(persistence_token: id).first
end

module UserCredentialAuthentication
  def verify_against_old_credentials( user, password )
    Sha512.matches?( user.sha512_password, password, user.sha512_salt )
  end

  def transition_from_sha512!( user, password )
    user.password = password
    user.sha512_password = nil
    user.sha512_salt = nil
    user.save
  end

  def authenticate!
    Rails.logger.warn("[AUTH] Authenticating user #{username} from #{medium}")
    user = User.find_by_username_or_email(username)

    if user.blank?
      Rails.logger.warn("[AUTH] No Such User")
      fail "Invalid email or password"

    elsif user.sha512_password.not.blank? && verify_against_old_credentials( user, password )
      Rails.logger.warn("[AUTH] User #{user.email} authenticated with a SHA512 password.")
      transition_from_sha512!( user, password )
      success! user

    elsif user.password_digest && user.authenticate( password )
      Rails.logger.warn("[AUTH] User #{user.email} authenticated with a password.")
      success! user

    else
      Rails.logger.warn("[AUTH] Bad Password")
      fail "Invalid email or password"

    end
  end
end


Warden::Strategies.add(:httpauth) do
  include UserCredentialAuthentication

  def medium
    'httpAuth'
  end

  def valid?
    Rails.logger.warn("[AUTH] checking httpAuth")
    auth.provided? && auth.basic?
  end

  def username
    auth.credentials[0]
  end

  def password
    auth.credentials[1]
  end

  def auth
    @auth ||= Rack::Auth::Basic::Request.new(env)
  end
end

Warden::Strategies.add(:params) do
  include UserCredentialAuthentication

  def medium
    'params'
  end

  def valid?
    Rails.logger.warn("[AUTH] checking params")
    credential_params['username'] && credential_params['password']
  end

  def username
    credential_params['username']
  end

  def password
    credential_params['password']
  end

  def credential_params
    p = params.blank? ? post_params : params
    p['user_session'] || {}
  end

  def post_params
    @post_params ||= get_post_params
  end

  def get_post_params
    if( request.post? )
      begin
        body = request.body.read
        request.body.rewind
        JSON.parse( body )
      end
    else
      {}
    end
  end
end
