# == Schema Information
#
# Table name: topics
#
#  id         :bigint(8)        not null, primary key
#  topic_name :string(255)      not null
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
