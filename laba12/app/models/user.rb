class User < ApplicationRecord
  validates :email, uniqueness: true

  def check_pass?(pass)
    password == Digest::SHA256.hexdigest(pass)
  end

  class << self
    def auth(email, password)
      user = find_by(email: email)
      return nil if user.nil?
      return user if user.check_pass?(password)
    end

    def create_user(email, password)
      p "alsdlsld: #{email}"
      return unless check_args(email, password)

      hash = Digest::SHA256.hexdigest(password)
      user = User.new(email: email, password: hash)
      if user.valid?
        user.save
        return user
      end
    end

    def check_args(email, pass)
      true unless email.match(/.+@.+/).nil? || pass.chars.size < 6
    end
  end
end
