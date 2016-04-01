# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  body            :text
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#  title           :string
#  user_id         :integer
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
