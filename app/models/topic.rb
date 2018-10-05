class Topic < ApplicationRecord
    validates :topic_name, presence: true, length: {maximum: 250}, format: { with: /\A[^0-9]+\z/}  
    validates :score, presence: true, inclusion: {in: 0..999999}
    has_many :sub_topics
end
