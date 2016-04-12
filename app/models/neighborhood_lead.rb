# == Schema Information
#
# Table name: neighborhood_leads
#
#  id              :integer          not null, primary key
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class NeighborhoodLead < ActiveRecord::Base
  belongs_to :lead, class_name: 'User', foreign_key: 'user_id'
  belongs_to :lead_neighborhoods, class_name: 'Neighborhood', foreign_key: 'neighborhood_id'
end
