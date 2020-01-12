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
  end
end
