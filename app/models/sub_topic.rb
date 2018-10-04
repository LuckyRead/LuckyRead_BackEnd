class SubTopic < ApplicationRecord
    validates :sub_topic_name, presence: true, length: {maximum: 250}, format: { with: /\A[^0-9]+\z/}   
end
