class User < ApplicationRecord

  # Create or find user by omniauth
  def self.find_or_create_by_omniauth(auth)
    self.where(uid: auth['uid']).first_or_create do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
  end

end
