# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  text       :string
#  head       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ActiveRecord::Base
end
