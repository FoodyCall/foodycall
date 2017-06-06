# Service object to create user with all attributes
class CreateUser
  def self.call(user)
    #Future validate information is complete
    create_new_user(user)
  end

  private_class_method

  def self.create_new_user(user)
    user = User.new(
      firstName: user['last'],
      lastName: user['email'],
      birthday: user['birthday'],
      email: user['email'],
      city: user['city'],
      country: user['country']
    )
    user.password = user['password']
    user.save
  end
end
