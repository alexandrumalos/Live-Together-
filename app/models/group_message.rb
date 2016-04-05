# == Schema Information
#
# Table name: group_messages
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  message_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupMessage < ActiveRecord::Base
  belongs_to :group
  belongs_to :message
end
