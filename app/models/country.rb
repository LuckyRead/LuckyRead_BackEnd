class Country < ApplicationRecord
    validates :country_name, presence: true, length: {maximum: 50, minimum: 2}, format: { with: /\A[^0-9]+\z/}   
end
