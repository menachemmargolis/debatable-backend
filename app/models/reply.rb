class Reply < ApplicationRecord
    belongs_to :user
    belongs_to :post 
    
    validates :title, presence: true 
    validates :content, presence: true
end
