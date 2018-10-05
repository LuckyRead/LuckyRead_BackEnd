class SubTopic < ApplicationRecord
    validates :sub_topic_name, presence: true, length: {maximum: 250}, format: { with: /\A[^0-9]+\z/}   
    has_many :users
    has_many :topics, through: :rel_topic_sub_topic
    has_many :fragments
end
