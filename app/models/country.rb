# == Schema Information
#
# Table name: countries
#
#  id           :bigint(8)        not null, primary key
#  country_name :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Country < ApplicationRecord
    validates :country_name, presence: true, length: {maximum: 150, minimum: 2}, format: { with: /\A[^0-9]+\z/}  
    has_many :cities
end
