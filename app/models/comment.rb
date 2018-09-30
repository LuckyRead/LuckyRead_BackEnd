class Comment < ApplicationRecord
    validates :message, presence: true, length: {maximum: 1000}
end
