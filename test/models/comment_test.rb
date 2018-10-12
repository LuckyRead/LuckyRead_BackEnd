# == Schema Information
#
# Table name: comments
#
#  id           :bigint(8)        not null, primary key
#  message      :text(65535)      not null
#  datetime     :datetime         not null
#  users_id     :bigint(8)        not null
#  fragments_id :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
