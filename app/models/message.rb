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

class Message < ActiveRecord::Base
  has_many :user_messages
  has_many :recipients, class_name: 'User', through: :user_messages
  belongs_to :sender, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :groups
end
