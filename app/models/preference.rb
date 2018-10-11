# == Schema Information
#
# Table name: preferences
#
#  id                      :bigint(8)        not null, primary key
#  users_id                :bigint(8)        not null
#  rel_topic_sub_topics_id :bigint(8)        not null
#  score                   :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Preference < ApplicationRecord
end
