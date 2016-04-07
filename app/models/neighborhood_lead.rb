# == Schema Information
#
# Table name: neighborhood_leads
#
#  id              :integer          not null, primary key
#  lead_id         :integer
#  neighborhood_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class NeighborhoodLead < ActiveRecord::Base
  belongs_to :lead, class_name: 'User', foreign_key: 'lead_id'
  belongs_to :lead_neighborhoods, class_name: 'Neighborhood', foreign_key: 'neighborhood_id'
end
