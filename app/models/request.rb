# == Schema Information
#
# Table name: requests
#
#  id              :integer          not null, primary key
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  neighborhood_id :integer
#  request_type    :string
#

class Request < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :user
end
