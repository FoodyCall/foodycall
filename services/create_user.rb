# Service object to create user with all attributes
class CreateUser
  def self.call(user)
    #Future validate information is complete
    create_new_user(user)
  end

  private_class_method

  def self.create_new_user(user)
    new_user = User.new(
      first_name: user[:firstName],
      last_name: user[:lastName],
      birthday: user[:birthday],
      email: user[:email],
      city: user[:city],
      country: user[:country]
    )
    new_user.password = user[:password]
    new_user.save
  end
end
