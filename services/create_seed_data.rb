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
        email: 'esalazar922@foodycall.com',
        birthday: "1992/07/31",
        country: "Taiwan",
        city: "Hsinchu",
        password: "12345",
        rating: 3,
        img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/14100426_10210148558808498_1279246961028949519_n.jpg?oh=6d71ee31c495c9b425597a195b222c21&oe=59D6F13D"
      }
    )

    user_beautiful_allie = CreateUser.call(
      firstName: "Allie",
      lastName: "Chang",
      email: 'alliekrchang@foodycall.com',
      birthday: "1992/07/31",
      country: "Taiwan",
      city: "Hsinchu",
      password: "12345",
      rating: 5,
      img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t31.0-8/18738886_1380613998699044_7654257757760782746_o.jpg?oh=81e1f71b34d5368e9dad5f0ba1879cd3&oe=59E0A574"
    )

    user_pola = CreateUser.call(
      firstName: "Pornlada",
      lastName: "Ittipornpithak",
      email: 'pornlada_pu@foodycall.com',
      birthday: "1991/03/07",
      country: "Thailand",
      city: "Bangkok",
      password: "12345",
      rating: 4,
      img_path: "https://scontent-hkg3-1.xx.fbcdn.net/v/t1.0-9/17952900_1416262921727193_3530661623660573207_n.jpg?oh=e64f92c8969a39e31e3330ba0829748a&oe=59A6984C"
    )

    user_gary = CreateUser.call(
      firstName: "Gary",
      lastName: "Lin",
      email: 'gary19930520@gmail.com',
      birthday: "1991/03/07",
      country: "Taiwan",
      city: "Taipei",
      password: "12345",
      rating: 4,
      img_path: "https://scontent-dft4-2.xx.fbcdn.net/v/t31.0-8/13254800_1195521160488736_9107727658111453397_o.jpg?oh=a933e6e8a030c5fbb9b95db292c8d04d&oe=59DAFC98"
    )

    user_caroline = CreateUser.call(
      {
        firstName: "Caroline",
        lastName: "Li",
        email: 'camellee13@foodycall.com',
        birthday: "1992/07/31",
        country: "Taiwan",
        city: "Hsinchu",
        password: "12345",
        rating: 5,
        img_path: "https://scontent-dft4-2.xx.fbcdn.net/v/t31.0-8/13490771_1131085823620434_5433302512654001123_o.jpg?oh=8e12b7afe04cd358c2c7d2df20dc1376&oe=59E35F3C"
      }
    )

    user_aylada = CreateUser.call(
      {
        firstName: "Aylada",
        lastName: "Oak Khun",
        email: 'aylada@foodycall.com',
        birthday: "1992/07/31",
        country: "Taiwan",
        city: "Hsinchu",
        password: "12345",
        rating: 5,
        img_path: "https://scontent-dft4-2.xx.fbcdn.net/v/t1.0-1/14725701_10155051191679879_2101467588329255168_n.jpg?oh=995943b6994cb95543b8d7c3b89e714a&oe=59A33083"
      }
    )

    user_ale = CreateUser.call(
      {
        firstName: "Alejandra",
        lastName: "Meraz",
        email: 'alejandrameraz@foodycall.com',
        birthday: "1992/07/31",
        country: "Taiwan",
        city: "Hsinchu",
        password: "12345",
        rating: 5,
        img_path: "https://scontent-dft4-2.xx.fbcdn.net/v/t31.0-8/18623399_10158601533310234_366199464251869569_o.jpg?oh=5a10ea3fa73c78b185c2f0edaeb9f3c9&oe=59DAD8C2"
      }
    )


    # Add events
    file = File.read("#{__dir__}/../db/seed/events.json")
    events = JSON.parse(file)

    event_allie = CreateEvent.call(
      host_id: user_beautiful_allie.id,
      event: events[0]
    )

    event_allie2 = CreateEvent.call(
      host_id: user_beautiful_allie.id,
      event: events[1]
    )

    event_pola = CreateEvent.call(
      host_id: user_pola.id,
      event: events[2]
    )

    event_pola2 = CreateEvent.call(
      host_id: user_pola.id,
      event: events[3]
    )

    event_eduardo =CreateEvent.call(
      host_id: user_eduardo.id,
      event: events[4]
    )

    event_eduardo2 = CreateEvent.call(
      host_id: user_eduardo.id,
      event: events[5]
    )

    #JoinEvent
    JoinEvent.call(
      user_id:user_beautiful_allie.id,
      event_id: event_allie.id,
      roles: ["Chef"],
      message: ''
    )

    JoinEvent.call(
      user_id:user_eduardo.id,
      event_id: event_allie.id,
      roles: ["Helper"],
      message: 'Hi Allie. I am Edward. I am not good at cooking; but i have a friend from Thailand. I am sure she is going to love to cook those dishes XD.'
    )

    JoinEvent.call(
      user_id:user_pola.id,
      event_id: event_allie.id,
      roles: ["Chef"],
      message: "Hey. Edward told me you want to eat thai food and we can use some ingredients i bought last week in Thailand. I am sure is going to great experience. "
    )

    JoinEvent.call(
      user_id:user_gary.id,
      event_id: event_allie.id,
      roles: ["Shopper"],
      message: "I love love thai food. Last week i cooked green curry with my friend. I have lots of ingredients for that and other dishes. Let us talk about other things we can cook."
    )

    CreateEventPost.call(
      user_id:user_gary.id,
      event_id: event_allie.id,
      post: "Where do you usually buy the ingredients for thai food?"
    )

    CreateEventPost.call(
      user_id:user_beautiful_allie.id,
      event_id: event_allie.id,
      post: "There's a store near that thay have some products from thailand. I know is very difficult to find some ingrediends. And you?"
    )

    CreateEventPost.call(
      user_id:user_gary.id,
      event_id: event_allie.id,
      post: "There's also a store but i have to find other because this one is going to close very soon."
    )

    CreateEventPost.call(
      user_id:user_pola.id,
      event_id: event_allie.id,
      post: "Don't worry about the ingredients because i know where to get everything. We can go to Taipei in case we need something special; but for the basic i think we can get it very easy here"
    )

    JoinEvent.call(
      user_id:user_beautiful_allie.id,
      event_id: event_allie2.id,
      roles: ["Helper"],
      message: ''
    )

    JoinEvent.call(
      user_id:user_pola.id,
      event_id: event_pola.id,
      roles: ["Chef"],
      message: ''
    )

    JoinEvent.call(
      user_id:user_caroline.id,
      event_id: event_pola.id,
      roles: ["Shopper"],
      message: 'Hi. I saw the menu and it look so yummy. I can buy the ingredients because i have fresh market near. '
    )

    JoinEvent.call(
      user_id:user_ale.id,
      event_id: event_pola.id,
      roles: ["Helper"],
      message: 'Japanese FOODDD YESSS. I wan to help please please. '
    )

    CreateEventPost.call(
      user_id:user_caroline.id,
      event_id: event_pola.id,
      post: "What things i should buy in the fresh market?"
    )

    CreateEventPost.call(
      user_id:user_pola.id,
      event_id: event_pola.id,
      post: "I am not sure yet. Yesterday i was looking for a nice recipe but still not sure which one to follow."
    )

    CreateEventPost.call(
      user_id:user_caroline.id,
      event_id: event_pola.id,
      post: "No problem i can find a good recipe. My boyfriend has many friends from Japan so it will be very easy to ask them.I'll post it as soon as I get the recipe."
    )

    CreateEventPost.call(
      user_id:user_pola.id,
      event_id: event_pola.id,
      post: "Thank you so much. You are very nice person. I'll be so happy to share a foodycall with you. See you soon!!!!"
    )




    JoinEvent.call(
      user_id:user_pola.id,
      event_id: event_pola2.id,
      roles: ["Shopper"],
      message: ''
    )

    JoinEvent.call(
      user_id:user_eduardo.id,
      event_id: event_eduardo.id,
      roles: ["Guest"],
      message: ''
    )

    JoinEvent.call(
      user_id:user_eduardo.id,
      event_id: event_eduardo2.id,
      roles: ["Cleaner"],
      message: ''
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
