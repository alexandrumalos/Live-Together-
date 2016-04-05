# == Schema Information
#
# Table name: user_neighborhood_connections
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserNeighborhoodConnection < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
end
