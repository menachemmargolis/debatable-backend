class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :replies, dependent: :destroy

    has_secure_password
    validates :password, length:{minimum: 3}
    validates :email,  format: { with: URI::MailTo::EMAIL_REGEXP, message: "invalid"  }
end
