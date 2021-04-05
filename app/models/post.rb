class Post < ApplicationRecord
    belongs_to :topic
    belongs_to :user
    has_many :replies, dependent: :destroy

    validates :title, presence: true 
    validates :content, length: {minimum: 30}
end
