class CreateSeedData
  def self.call
    role_check = CreateRole.call(
      name: "Chef"
    )
    role_helper = CreateRole.call(
      name: "Helper"
    )
    role_shopper = CreateRole.call(
      name: "Shopper"
    )
    role_cleaner = CreateRole.call(
      name: "Cleaner"
    )
    role_guest = CreateRole.call(
      name: "Guest"
    )

    user_paul = CreateUser.call(
      {firstName: "Paul",
      lastName: "Rivera",
      email: 'test@test.com',
      birthday: "1991/04/12",
      country: "Honduras",
      city: "Tegucigalpa",
      password: "12345",
      img_path: ""}
    )

    # user_edu = CreateUser.call(
    #   {firstName: "Ed",
    #   lastName: "Sal",
    #   email: 'ed@sal.com',
    #   birthday: "1991/04/12",
    #   country: "Nicaragua",
    #   city: "Managua",
    #   password: "12345",
    #   img_path: ""}
    # )
  end
end
