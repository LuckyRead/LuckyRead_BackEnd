class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    validates :email, presence: true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :username, presence: true, uniqueness: true, length: {maximum: 50, minimum: 2}, format: {with: /\A\S+\z/}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
    has_many :fragments, through: :reaction
    has_many :sub_topics, :through => :preference
    has_many :comments
    has_many :responses
    has_one :photo
    has_many :users, through: :friend
    has_many :users

    def self.preferencessub_topic_name (id)
        return User.joins(:sub_topics).where("user.id = ?",id)
    end

    def self.fiends (id)
        return User.joins(users).where("user.id = ?",id)
    end
end


