class Response < ApplicationRecord
    validates :date, presence: true
    validates :message, presence: true, length: {maximum: 1000}
end
