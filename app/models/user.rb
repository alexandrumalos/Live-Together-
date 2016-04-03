# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  username                :string
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default("0"), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string
#  last_sign_in_ip         :string
#  forem_admin             :boolean          default("f")
#  forem_state             :string           default("pending_review")
#  forem_auto_subscribe    :boolean          default("f")
#  current_neighborhood_id :integer
#  type                    :string
#

#may can use has_and_belongs_to_many :groups :neighborhoods

class User < ActiveRecord::Base
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_groups
  has_many :groups, through: :user_groups
  belongs_to :current_neighborhood, class_name: 'Neighborhood', foreign_key: 'current_neighborhood_id'

  has_many :user_neighborhood_connections
  has_many :neighborhoods, class_name: 'Neighborhood', through: :user_neighborhood_connections

  has_many :requests, dependent: :destroy
  has_many :user_messages
  has_many :received_messages, class_name: 'Message', through: :user_messages
  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :posts

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
