class User < ApplicationRecord
    has_many :posts 
    has_many :replies

    has_secure_password

    validates :email,  format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid"  }
    validates :username, uniqueness: { case_sensitive: false }
end
