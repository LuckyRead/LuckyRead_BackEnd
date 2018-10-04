class Country < ApplicationRecord
    validates :country_name, presence: true, length: {maximum: 150, minimum: 2}, format: { with: /\A[^0-9]+\z/}  
end
