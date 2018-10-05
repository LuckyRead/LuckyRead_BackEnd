class Fragment < ApplicationRecord
    validates :title, presence: true, length: {maximum: 10000}
    validates :introduction, length: {maximum: 1000} 
    validates :content, length: {maximum: 50000}
    validates :source, length: {maximum: 250}
    validates :users_id, presence: true    
    has_many :users
    has_many :comments
    has_many :sub_topics through: :rel_fragment_sub_topic
end
