# == Schema Information
#
# Table name: responses
#
#  id          :bigint(8)        not null, primary key
#  message     :text(65535)      not null
#  datetime    :datetime         not null
#  comments_id :bigint(8)        not null
#  users_id    :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord
    validates :datetime, presence: true
    validates :message, presence: true, length: {maximum: 1000}
    belongs_to :comment, optional: true
end
