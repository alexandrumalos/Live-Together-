# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  password_digest        :string
#  name                   :string
#  isNewser               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  forem_admin            :boolean          default(FALSE)
#  forem_state            :string           default("pending_review")
#  forem_auto_subscribe   :boolean          default(FALSE)
#

#may can use has_and_belongs_to_many :groups :neighborhoods

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :neighborhoods
  has_many :requests, dependent: :destroy
  has_many :received_messages, class_name: 'Message', through: :user_message_connections
  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'

  def forem_name
    name
  end

  def forem_email
    email
  end
end
