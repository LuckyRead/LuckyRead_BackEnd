# == Schema Information
#
# Table name: friends
#
#  id         :bigint(8)        not null, primary key
#  follower   :bigint(8)        not null
#  followed   :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friend < ApplicationRecord
end
