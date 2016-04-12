# == Schema Information
#
# Table name: neighborhood_leads
#
#  id              :integer          not null, primary key
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'test_helper'

class NeighborhoodLeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
