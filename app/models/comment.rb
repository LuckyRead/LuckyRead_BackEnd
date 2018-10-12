# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  message      :text(65535)      not null
#  datetime     :datetime         not null
#  users_id     :bigint(8)        not null
#  fragments_id :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
    validates :message, presence: true, length: {maximum: 25000}
    belongs_to :user, optional: true
    belongs_to :fragment, optional: true
    has_many :responses
end
