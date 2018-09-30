class City < ApplicationRecord
    validates :city_name, presence: true, length: {minimum: 2, maximum: 5}, format: { with: /\A[^0-9]+\z/}   
end
