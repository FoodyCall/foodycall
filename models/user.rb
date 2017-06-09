require "sequel"
class User < Sequel::Model
  plugin :timestamps, update_on_create: true
  one_to_many :events, :key=>:host_id
  ont_to_many :event_participants

  def password=(pw_plaintext)
    #self.password_encrypted = SecureDB.encrypt(pw_plaintext) if pw_plaintext
    self.password_encrypted = pw_plaintext
  end

  def password
    #SecureDB.decrypt(password_encrypted)
    self.password_encrypted
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
