# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  topic_name :string(255)      not null
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ApplicationRecord
    validates :topic_name, presence: true, length: {maximum: 250}, format: { with: /\A[^0-9]+\z/}  
    validates :score, presence: true, inclusion: {in: 0..999999}
    has_many :sub_topics, through: :rel_topic_sub_topic
end
