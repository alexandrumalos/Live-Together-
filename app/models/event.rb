# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  location        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  start_time      :datetime
#  user_id         :integer
#  neighborhood_id :integer
#  status          :string
#  request_id      :integer
#

class Event < ActiveRecord::Base
    validates :name, :description, :location, presence: true
    belongs_to :user
    belongs_to :neighborhood
    belongs_to :request, dependent: :destroy
end
