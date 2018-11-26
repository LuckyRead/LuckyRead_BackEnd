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
        return User.joins('
            INNER JOIN sub_topics_users ON users.id = sub_topics_users.user_id
            INNER JOIN sub_topics ON sub_topics_users.sub_topic_id = sub_topics.id
        ').where(
            'users.id = ?', id
        ).select(
            'sub_topics.id as id',
            'sub_topics.sub_topic_name as sub_topic_name',
            'sub_topics_users.score as score'
        )
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
        return User.where("users.created_at >= (now() - interval 1 month)").pluck(:id, :username)
    end
    
    scope :bestuser, ->(limit){order("score asc").limit(limit).pluck(:username, :talk_to_us, :name, :photos_id)}

    scope :user_most_recent, ->(limit){order("created_at desc").limit(limit)}

    def self.notificate
        @userfirst = User.first
        @userlast = User.last
        id = Faker::Number.between(@userfirst.id, @userlast.id)
        idfragment = User.preferencessub_topic_name(id).take
        fragment = RelFragmentSubTopic.fragment(idfragment)
        SendFragmentIntroductionJob.set(wait: 1.day)perform(User.find(id), fragment)
    end
end


