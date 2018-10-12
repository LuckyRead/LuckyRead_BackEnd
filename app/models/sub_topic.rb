# == Schema Information
#
# Table name: sub_topics
#
#  id             :bigint(8)        not null, primary key
#  sub_topic_name :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SubTopic < ApplicationRecord
    validates :sub_topic_name, presence: true, length: {maximum: 250}, format: { with: /\A[^0-9]+\z/}   
    has_many :users
    has_many :topics, through: :rel_topic_sub_topic
    has_many :fragments
end
