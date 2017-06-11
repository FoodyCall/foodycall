require 'json'
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


    user_eduardo = CreateUser.call(
      {
        firstName: "Eduardo",
        lastName: "Salazar",
        email: 'esalazar922@gmail.com',
        birthday: "1992/07/31",
        country: "Nicaragua",
        city: "Managua",
        password: "12345",
        img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/14100426_10210148558808498_1279246961028949519_n.jpg?oh=6d71ee31c495c9b425597a195b222c21&oe=59D6F13D"
      }
    )

    user_beautiful_allie = CreateUser.call(
      firstName: "Allie",
      lastName: "Chang",
      email: 'alliekrchang@gmail.com',
      birthday: "1992/07/31",
      country: "Nicaragua",
      city: "Managua",
      password: "12345",
      img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t31.0-8/18738886_1380613998699044_7654257757760782746_o.jpg?oh=81e1f71b34d5368e9dad5f0ba1879cd3&oe=59E0A574"
    )

    user_pola = CreateUser.call(
      firstName: "Pornlada",
      lastName: "Ittipornpithak",
      email: 'pornlada_pu@hotmail.com',
      birthday: "1991/03/07",
      country: "Thailand",
      city: "Bangkok",
      password: "12345",
      img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/17952900_1416262921727193_3530661623660573207_n.jpg?oh=e64f92c8969a39e31e3330ba0829748a&oe=59A6984C"
    )

    # Add events
    file = File.read("#{__dir__}/../db/seed/events.json")
    events = JSON.parse(file)

    CreateEvent.call(
      host_id: user_beautiful_allie.id,
      event: events[0]
    )

    CreateEvent.call(
      host_id: user_beautiful_allie.id,
      event: events[1]
    )

    CreateEvent.call(
      host_id: user_pola.id,
      event: events[2]
    )

    CreateEvent.call(
      host_id: user_pola.id,
      event: events[3]
    )

    CreateEvent.call(
      host_id: user_eduardo.id,
      event: events[4]
    )

    CreateEvent.call(
      host_id: user_eduardo.id,
      event: events[5]
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
