module ApplicationHelper
  def is_lead(user, neighborhood)
    if neighborhood.leads.include?(user)
      true
    else
      false
    end
  end

  def isNewser(user)
    if user.user_type == 'newser'
      true
    else
      false
    end
  end
end
