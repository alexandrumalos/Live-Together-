# == Schema Information
#
# Table name: neighborhood_leads
#
#  id              :integer          not null, primary key
#  lead_id         :integer
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class NeighborhoodLeadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
