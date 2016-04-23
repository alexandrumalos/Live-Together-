module ApplicationHelper
  def is_lead(user, neighborhood)
    if neighborhood.leads.include?(user) || user.user_type == 'admin'
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

  def tag_color(user)
    if isNewser(user)
      'label-primary'
    else
      'label-success'
    end
  end
end
