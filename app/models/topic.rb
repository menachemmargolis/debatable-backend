class Topic < ApplicationRecord
    belongs_to :catagory
    has_many :posts, dependent: :destroy

    validates :title, presence: true
    validates :description, length:{minimum: 10}
end
