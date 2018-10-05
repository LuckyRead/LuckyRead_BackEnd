class Response < ApplicationRecord
    validates :datetime, presence: true
    validates :message, presence: true, length: {maximum: 1000}
    belongs_to :comment
end
