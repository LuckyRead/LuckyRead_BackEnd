# == Schema Information
#
# Table name: photos
#
#  id         :bigint(8)        not null, primary key
#  path       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
    validates :path, presence: true
    belongs_to :user
    belongs_to :fragment
end
