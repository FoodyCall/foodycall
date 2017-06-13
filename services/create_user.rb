require 'json'
# Service object to create user with all attributes
class CreateUser
  def self.call(user)
    #Future validate information is complete
    create_new_user(user)
  end

  private_class_method

  def self.create_new_user(user)
    img = (user[:img_path] != nil) ? user[:img_path] : "https://api.adorable.io/avatars/285/abott@adorable.png"
    new_user = User.new(
      first_name: user[:firstName],
      last_name: user[:lastName],
      birthday: user[:birthday],
      email: user[:email],
      city: user[:city],
      country: user[:country],
      rating: user[:rating],
      img_path: img
    )
    new_user.password = user[:password]
    new_user.save
  end
end
