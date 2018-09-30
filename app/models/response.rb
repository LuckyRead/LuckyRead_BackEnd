class Response < ApplicationRecord
    validates :date, presence: true
    validates :message, presence: true, length: {maximum: 1000}
    has_one :comment, class_name: "comment", foreign_key: "comment_id"
end
