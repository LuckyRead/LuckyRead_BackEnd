# == Schema Information
#
# Table name: reactions
#
#  id           :bigint(8)        not null, primary key
#  users_id     :bigint(8)        not null
#  fragments_id :bigint(8)        not null
#  reaction     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Reaction < ApplicationRecord
    def self.likes (id)
        Reaction.where("reactions.fragments_id = ? and reactions.reaction = '1'", id).count()
    end

    def self.dislikes (id)
        Reaction.where("reactions.fragments_id = ? and reactions.reaction = '-1'", id).count()
    end

    def self.useractive #Return the activity of users
        return Reaction.group(:users_id).count()
    end

    def self.useractivedate(date) #Return the activity of users one date specific
        dateinit = date + ' 00:00:00'
        dateend = date + ' 23:59:59'
        return Reaction.where("reactions.created_at >= ? and reactions.created_at <= ?", dateinit, dateend).group(:users_id).count()
    end

    def self.useractivedateanduser(id, date) #Return the activity of one user and date specific 
        return Reaction.where("reactions.users_id = ? and reactions.created_at >= ?", id, date).group(:users_id).count()
    end

    def self.fragmentslikes #return the likes of each fragment
        return Reaction.where("reactions.reaction = '1'").group(:fragments_id).count()
    end 

    def self.fragmentsdisklikes #return the likes of each fragment
        return Reaction.where("reactions.reaction = '-1'").group(:fragments_id).count()
    end 
end
