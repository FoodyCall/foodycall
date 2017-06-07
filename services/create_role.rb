# Service object to create user with all attributes
class CreateRole
  def self.call(user)
    #Future validate information is complete
    create_new_user(user)
  end

  private_class_method

  def self.create_new_user(user)
    user = Role.new(
      name: user[:name]
    )
    user.save
  end
end
