# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string(255)      not null
#  name            :string(255)      not null
#  lastname        :string(255)      not null
#  password_digest :string(255)      not null
#  cities_id       :bigint(8)        not null
#  score           :string(255)
#  talk_to_us      :string(255)
#  photos_id       :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
