# Find account and check password
class AuthenticateUser
  def self.call(user_credentials)
    user = User.first(email: user_credentials['email'])
    passwords_match(user, user_credentials)
  end

  private_class_method
  def self.passwords_match(user, credentials)
    user && user.password?(credentials['password'])
  end
end
