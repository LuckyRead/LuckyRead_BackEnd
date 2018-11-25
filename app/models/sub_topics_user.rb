class SubTopicsUser < ApplicationRecord
    def self.topicuser (id)
        return SubTopicsUser.joins('
        inner join sub_topics_topics on sub_topics_topics.sub_topic_id = sub_topics_users.sub_topic_id').where(
            'sub_topics_topics.topic_id = ?', id)
    end
end