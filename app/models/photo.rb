class Photo < ApplicationRecord
    validates :path, presence: true
end
