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
    has_many :sub_topics, through: :rel_fragment_sub_topic
    has_one :photo
end
