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
    def self.userfollowed #return followers of all users
        return Friend.group(:followed).count()
    end 

    def self.userfollowedesp(id, date) #return news followers of a specific user
        return Friend.where("friends.follower = ? and friends.created_at >= ?", id, date).group(:followed).count()
    end 

end
