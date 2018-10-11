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

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
