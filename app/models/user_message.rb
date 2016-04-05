# == Schema Information
#
# Table name: user_messages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  message_id :integer
#

class UserMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :received_messages, class_name: 'Message', foreign_key: 'message_id'
end
