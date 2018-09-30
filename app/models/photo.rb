class Photo < ApplicationRecord
    validates :path, presence: true, uniqueness: { case_sensitive: false }
end
