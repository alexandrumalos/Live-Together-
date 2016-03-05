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
#

class Neighborhood < ActiveRecord::Base
    has_and_belongs_to_many :users
    has_many :posts, dependent: :destroy
    has_many :requests, dependent: :destroy
end
