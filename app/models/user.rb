class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 50}, format: { with: => [a-zA-Z] }   
end
