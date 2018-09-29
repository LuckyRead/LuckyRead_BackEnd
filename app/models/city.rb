class City < ApplicationRecord
    validates :city_name, presence: true, length: {minimum: 2}
end
