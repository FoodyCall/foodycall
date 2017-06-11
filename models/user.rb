require "sequel"
class User < Sequel::Model
  plugin :timestamps, update_on_create: true
  one_to_many :events, :key=>:host_id
  one_to_many :event_participants

  def firstName
    first_name
  end

  def lastName
    last_name
  end

  def fullName
    firstName + ' ' + lastName
  end

  def rate
    rating ? rating : 0
  end


  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
  end

  def img
    img_path
  end

  def password=(pw_plaintext)
    new_salt = SecureMSG.new_salt
    hashed = SecureMSG.hash_password(new_salt, pw_plaintext)
    self.salt = new_salt
    self.password_encrypted = hashed
  end

  def password?(try_password)
    try_hashed = SecureMSG.hash_password(salt, try_password)
    puts try_hashed==password_encrypted
    try_hashed == password_encrypted
  end

  def to_json(options = {})
    JSON({
            id: id,
            firstName: first_name,
            lastName: last_name,
            email: email,
            country: country,
            city: city,
            rating: rating,
            img: img_path
          },
         options)
  end
end
