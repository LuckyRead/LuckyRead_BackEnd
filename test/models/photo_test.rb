# == Schema Information
#
# Table name: photos
#
#  id         :bigint(8)        not null, primary key
#  path       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
