class SubTopicsUser < ApplicationRecord
    def self.topicuser (id, iduser)
        return SubTopicsUser.joins('
        inner join sub_topics_topics on sub_topics_topics.sub_topic_id = sub_topics_users.sub_topic_id').where(
            'sub_topics_topics.topic_id = ? and sub_topics_users.user_id = ?', id, iduser)
    end
end