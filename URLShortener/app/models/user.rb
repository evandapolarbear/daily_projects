class User < ActiveRecord::Base
  validates :email, prescence: true, uniquiness: true
end
