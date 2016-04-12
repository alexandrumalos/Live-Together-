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

module NeighborhoodsHelper
  def user_in_neighborhood(user, neighborhood)
    return neighborhood.users.include?(user)
  end
end
