# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  threshold   :integer
#  parent_id   :integer
#

require 'test_helper'

class NeighborhoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
