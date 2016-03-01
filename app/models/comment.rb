# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  score      :integer
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
end
