class Comment < ApplicationRecord
    validates :message, presence: true, length: {maximum: 25000}
    has_one :fragment
end
