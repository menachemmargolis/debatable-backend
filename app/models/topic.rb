class Topic < ApplicationRecord
    belongs_to :catagory
    has_many :posts

    validates :title, presence: true
    validates :description, length:{minimum: 10}
end
