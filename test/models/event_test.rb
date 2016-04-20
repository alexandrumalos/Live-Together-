# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  start_time      :datetime
#  user_id         :integer
#  neighborhood_id :integer
#  status          :string
#  request_id      :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
