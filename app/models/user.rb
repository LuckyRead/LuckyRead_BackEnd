class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :email, presence:true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :password, presence: true, length: {maximum: 250}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
end
