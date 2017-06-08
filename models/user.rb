require "sequel"
class User < Sequel::Model
  plugin :timestamps, update_on_create: true
  one_to_many :events

  def password=(pw_plaintext)
    #self.password_encrypted = SecureDB.encrypt(pw_plaintext) if pw_plaintext
    self.password_encrypted = pw_plaintext
  end

  def password
    #SecureDB.decrypt(password_encrypted)
    self.password_encrypted
  end
end
