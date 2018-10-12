# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string(255)      not null
#  name            :string(255)      not null
#  lastname        :string(255)      not null
#  password_digest :string(255)      not null
#  cities_id       :bigint(8)        not null
#  score           :string(255)
#  talk_to_us      :string(255)
#  photos_id       :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
<<<<<<< HEAD
    has_secure_password
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    validates :email, presence: true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :username, presence: true, uniqueness: true, length: {maximum: 50, minimum: 2}, format: {with: /\A\S+\z/}
    #validates :password, presence: true, length: {maximum: 250}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
    #belongs_to :city
    #has_many :fragments, through: :reaction
    #has_many :sub_topics, through: :preference
    #has_many :comments
    #has_many :responses
    #has_one :photo
    #has_many :users, through: :friend
    #has_many :users
=======
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
    validates :email, presence:true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :password_digest, presence: true, length: {maximum: 250}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
    belongs_to :city, optional: true
    has_many :fragments, through: :reaction
    has_many :sub_topics, through: :preference
    has_many :comments
    has_many :responses
    has_one :photo
    has_many :users, through: :friend
    has_many :users
>>>>>>> feature/8-populate-database
end
