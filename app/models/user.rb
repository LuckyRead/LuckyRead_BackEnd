class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    #validates :lastname, presence: true, length: {maximum: 200, minimum: 2}, format: { with: /\A[^0-9]+\z/}
    validates :email, presence: true, length: {maximum: 200, minimum: 5}, format: {with: /\A\S+@.+\.\S+\z/}
    validates :username, presence: true, uniqueness: true, length: {maximum: 50, minimum: 2}, format: {with: /\A\S+\z/}
    validates :score, presence: false
    validates :talk_to_us, length: {maximum: 10000}
    has_many :fragments, through: :reaction
    has_and_belongs_to_many :sub_topics#, :through => :preferences
    has_many :comments
    has_many :responses
    has_one :photo
    has_many :users, through: :friend
    has_many :users

    def self.preferencessub_topic_name (id)
        return User.joins(:sub_topics).where("users.id = ?",id).pluck(:username, :sub_topic_name)
    end
    
    def self.preferencestopic_name (id)
        return User.joins(sub_topics: :topics).where("users.id = ?",id).pluck(:username, :topic_name).uniq
    end

    def self.fiends (id)
        return User.joins(:users).where("users.id = ?",id)
    end

    def self.comments (id) #User's comments in a fragment specific, return username, message and fragment's title
        return User.joins(comments: :fragment).where("users.id = ?",id).pluck(:username, :message, :title)
    end

    def self.checkusername (username)
        return User.where("users.username = ?", username)
    end

    def self.checkemail (email)
        return User.where("users.email = ?", email)
    end
    
    def self.userold #return last users register
        return User.where("users.created_at >= (now() - interval 1 month)")
    end
=begin
    def self.bestuser
        return User.order(score: :desc).take(5).pluck(:username, :talk_to_us)
    end
=end
    scope :bestuser, ->(limit){order("score asc").limit(limit).pluck(:username, :talk_to_us)}

    scope :user_most_recent, ->(limit){order("created_at desc").limit(limit)}
=begin    
    def self.changepreferencesadd(id, preferences[])
        @i = 0
        preferences.length.times do
            SubTopicsUser.create!(
                        user_id: id,
                        sub_topic_id: preferences[i].id,
                        score: 0
                    )
            i += 1
        end
    end

    def self.changepreferencesremove(id, preferences[])
        @i = 0
        preferences.length.times do
            SubTopicsUser.where("SubTopicsUser.user_id = ? and SubTopicsUser.sub_topic_id = ? ", id, preferences[i].id)
            i += 1
        end
    end
=end


end


