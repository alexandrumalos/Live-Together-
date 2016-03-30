# == Schema Information
#
# Table name: categories
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Category < ActiveRecord::Base
  belongs_to :neighborhood
end
