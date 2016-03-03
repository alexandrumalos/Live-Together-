# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  email      :string
#  name       :string
#  isNewser   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#may can use has_and_belongs_to_many :groups :neighborhoods

class User < ActiveRecord::Base
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :neighborhoods

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
