class User < ActiveRecord::Base

  has_many :posts
  
  acts_as_authentic do |config|
    Authlogic::CryptoProviders::BCrypt.cost = 6
    config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
end
