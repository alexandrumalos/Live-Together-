# == Schema Information
#
# Table name: user_neighborhood_connections
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserNeighborhoodConnectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
