# == Schema Information
#
# Table name: fragments
#
#  id           :bigint(8)        not null, primary key
#  title        :string(255)      not null
#  introduction :text(65535)      not null
#  content      :text(65535)      not null
#  score        :integer
#  source       :string(255)      not null
#  users_id     :bigint(8)        not null
#  photos_id    :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class FragmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
