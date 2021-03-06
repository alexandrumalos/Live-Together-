# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :string
#  head       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

module MessagesHelper
  def classIfSender(user, message)
    if message.sender == user
      'is-sender'
    else
      ''
    end
  end
end
