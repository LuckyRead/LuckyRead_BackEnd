# == Schema Information
#
# Table name: rel_fragment_sub_topics
#
#  id            :bigint(8)        not null, primary key
#  fragments_id  :bigint(8)        not null
#  sub_topics_id :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class RelFragmentSubTopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
