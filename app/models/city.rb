class City < ApplicationRecord
    validates :city_name, presence: true, length: {minimum: 2}, format: { with: /\A[^0-9]+\z/}
    belongs_to :country
    has_many :users
end
