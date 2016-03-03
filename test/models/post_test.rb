# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  post       :text
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
