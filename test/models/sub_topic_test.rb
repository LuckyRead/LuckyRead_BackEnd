# == Schema Information
#
# Table name: sub_topics
#
#  id             :bigint(8)        not null, primary key
#  sub_topic_name :string(255)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SubTopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
