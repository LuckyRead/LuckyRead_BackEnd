# == Schema Information
#
# Table name: responses
#
#  id          :bigint(8)        not null, primary key
#  message     :text(65535)      not null
#  datetime    :datetime         not null
#  comments_id :bigint(8)        not null
#  users_id    :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
