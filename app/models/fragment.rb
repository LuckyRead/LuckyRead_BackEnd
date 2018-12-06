# == Schema Information
#
# Table name: fragments
#
#  id           :bigint(8)        not null, primary key
#  title        :string(255)      not null
#  introduction :text(65535)      not null
#  content      :text(65535)      not null
#  score        :integer
#  source       :string(255)      not null
#  users_id     :bigint(8)        not null
#  photos_id    :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Fragment < ApplicationRecord
    validates :title, presence: true
    validates :users_id, presence: true    
    has_many :users
    has_many :comments
    has_and_belongs_to_many :sub_topics#, through: :rel_fragment_sub_topic
    has_one :photo
=begin
    def self.bestfragment
        return Fragment.order(score: :desc).take(5)
    end
=end
    scope :bestfragment, ->(limit){order("score desc").limit(limit)}

    def self.Fragmentrandomwithoutregister (id) #Get 1
        return Fragment.joins("
            INNER JOIN rel_fragment_sub_topics ON fragments.id = rel_fragment_sub_topics.fragments_id
            INNER JOIN sub_topics_users ON sub_topics_users.sub_topic_id = rel_fragment_sub_topics.sub_topics_id
        ").where(
            "sub_topics_users.sub_topic_id = ?",id
        ).pluck(
            :id,
            :title,
            :introduction,
            :content,
            :score,
            :source,
            :created_at,
            :updated_at,
            :photos_id
        )
    end

    def self.Fragmentsubtopicwithprefecensuser_any (id)#Post 3 ID user
        return Fragment.joins("
            INNER JOIN rel_fragment_sub_topics ON fragments.id = rel_fragment_sub_topics.fragments_id
            INNER JOIN sub_topics_users ON sub_topics_users.sub_topic_id = rel_fragment_sub_topics.sub_topics_id
        ").where(
            "sub_topics_users.user_id = ?", id
        ).pluck(
            :id,
            :title,
            :introduction,
            :content,
            :score,
            :source,
            :photos_id
        )
    end

    def self.Fragmentsubtopicwithprefecensuser_user (id)#Post 3 ID user
        return Fragment.joins("
            INNER JOIN rel_fragment_sub_topics ON fragments.id = rel_fragment_sub_topics.fragments_id
            INNER JOIN sub_topics_users ON sub_topics_users.sub_topic_id = rel_fragment_sub_topics.sub_topics_id
        ").where(
            "sub_topics_users.user_id = ? and fragments.users_id != ?", id, 1
        ).pluck(
            :id,
            :title,
            :introduction,
            :content,
            :score,
            :source,
            :photos_id
        )
    end

    def self.Fragmentsubtopicwithprefecensuser_luckyread (id)#Post 3 ID user
        return Fragment.joins("
            INNER JOIN rel_fragment_sub_topics ON fragments.id = rel_fragment_sub_topics.fragments_id
            INNER JOIN sub_topics_users ON sub_topics_users.sub_topic_id = rel_fragment_sub_topics.sub_topics_id
        ").where(
            "sub_topics_users.user_id = ? and fragments.users_id = ?", id, 1
        ).pluck(
            :id,
            :title,
            :introduction,
            :content,
            :score,
            :source,
            :photos_id
        )
    end

    def self.fragmentold #return last users register
        return Fragment.where("fragments.created_at >= (now() - interval 1 month)")
    end

    def self.topicsUnderFragment (id)
        return Fragment.joins('
            INNER JOIN rel_fragment_sub_topics ON fragments.id = rel_fragment_sub_topics.fragments_id
            INNER JOIN sub_topics_topics ON rel_fragment_sub_topics.sub_topics_id = sub_topics_topics.sub_topic_id
            INNER JOIN topics ON sub_topics_topics.topic_id = topics.id
        ').where(
            'fragments.id = ?', id
        ).select(
            'topics.id AS id',
            'topics.topic_name AS name',
            'topics.score AS score'
        )
    end

end
