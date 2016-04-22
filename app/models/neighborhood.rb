# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  name        :string
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  threshold   :integer
#  parent_id   :integer
#

class Neighborhood < ActiveRecord::Base
  mount_uploader :image_url, NhoodUploader

  has_many :user_neighborhood_connections
  has_many :users, class_name: 'User', through: :user_neighborhood_connections
  has_many :neighborhood_leads
  has_many :leads, class_name: 'User', through: :neighborhood_leads

  has_many :active_users, class_name: 'User'
  has_many :categories, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :events

  belongs_to :parent, class_name: 'Neighborhood', foreign_key: :parent_id
  has_many :children, class_name: 'Neighborhood', foreign_key: :parent_id
end
