class Photo < ApplicationRecord
    validates :path, presence: true
    belongs_to :user
    belongs_to :fragment
end
