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
    validates :title, presence: true, length: {maximum: 10000}
    validates :introduction, length: {maximum: 1000} 
    validates :content, length: {maximum: 50000}
    validates :source, length: {maximum: 250}
    validates :users_id, presence: true    
    has_many :users
    has_many :comments
    has_and_belongs_to_many :sub_topics#, through: :rel_fragment_sub_topic
    has_one :photo

    def self.bestfragment
        return Fragment.order(score: :desc).take(5)
    end

    def self.Fragmentrandomwithoutregister (id) #Get 1
        return Fragment.joins("inner join `rel_fragment_sub_topics` on `fragments`.`id` = `rel_fragment_sub_topics`.`fragments_id` inner join `sub_topics_users` on `sub_topics_users`.`sub_topic_id` = `rel_fragment_sub_topics`.`sub_topics_id` inner join `photos` on `fragments`.`photos_id` = `photos`.`fragment_id`").where("sub_topics_users.sub_topic_id = ?",id).order("RAND()").pluck(:id, :title, :introduction, :content, :score, :source, :created_at, :updated_at, :path).first
    end

    def self.Fragmentsubtopicwithprefecensuser (id)#Post 3 ID user
        return Fragment.joins("inner join `rel_fragment_sub_topics` on `fragments`.`id` = `rel_fragment_sub_topics`.`fragments_id` inner join `sub_topics_users` on `sub_topics_users`.`sub_topic_id` = `rel_fragment_sub_topics`.`sub_topics_id` inner join `photos` on `fragments`.`photos_id` = `photos`.`fragment_id`").where("sub_topics_users.user_id = ?",id).order("RAND()").pluck(:id, :title, :introduction, :content, :score, :source, :created_at, :updated_at, :path).first
        #return Fragment.joins(sub_topics: :users).where("users.id = ?",id)
    end


end
