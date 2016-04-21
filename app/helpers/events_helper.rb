# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  date        :date
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

module EventsHelper
    
    def canDeleteEvent(user, event)
        if event.neighborhood.users.include?(user)
          user.id == event.user_id || is_lead(user, event.neighborhood)
        else
          false
        end
    end
    
end
