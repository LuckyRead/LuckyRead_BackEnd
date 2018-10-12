# == Schema Information
#
# Table name: reactions
#
#  id           :bigint(8)        not null, primary key
#  users_id     :bigint(8)        not null
#  fragments_id :bigint(8)        not null
#  reaction     :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
