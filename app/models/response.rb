class Response < ApplicationRecord
    validates :datetime, presence: true
    validates :message, presence: true, length: {maximum: 1000}
    has_one :comment
end
