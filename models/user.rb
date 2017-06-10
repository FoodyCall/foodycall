require "sequel"
class User < Sequel::Model
  plugin :timestamps, update_on_create: true
  one_to_many :events, :key=>:host_id

  def password=(pw_plaintext)
    new_salt = SecureMSG.new_salt
    hashed = SecureMSG.hash_password(new_salt, pw_plaintext)
    self.salt = new_salt
    self.password_encrypted = hashed
  end

  def password?(try_password)
    try_hashed = SecureMSG.hash_password(salt, try_password)
    puts "Trying password"
    puts try_password
    puts "#{try_hashed}==#{password_encrypted}"
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
