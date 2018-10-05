class Comment < ApplicationRecord
    validates :message, presence: true, length: {maximum: 25000}
    belongs_to :user
    belongs_to :fragment
    has_many :responses
end
