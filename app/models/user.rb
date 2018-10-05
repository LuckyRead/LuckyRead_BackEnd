class User < ApplicationRecord
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :email, presence:true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :password, presence: true, length: {maximum: 250}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
    belongs_to :city
    has_many :fragments, through: :reaction
    has_many :sub_topics, through: :preference
    has_many :comments
    has_many :responses
    has_one :photo
    has_many :users, through: :friend
    has_many :users
end
