# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  post            :text
#  score           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#

class Post < ActiveRecord::Base
  belongs_to :neighborhood
end