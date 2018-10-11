# == Schema Information
#
# Table name: cities
#
#  id           :bigint(8)        not null, primary key
#  city_name    :string(255)      not null
#  countries_id :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class City < ApplicationRecord
    validates :city_name, presence: true, length: {minimum: 2}, format: { with: /\A[^0-9]+\z/}
    belongs_to :country
    has_many :users
end
