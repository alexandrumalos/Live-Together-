# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  password_digest        :string
#  name                   :string
#  isNewser               :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  forem_admin            :boolean          default(FALSE)
#  forem_state            :string           default("pending_review")
#  forem_auto_subscribe   :boolean          default(FALSE)
#

module UsersHelper
  def canEditPost(user, post)
    if post.neighborhood.users.include?(user)
      user.id == post.user_id || is_lead(user, user.current_neighborhood)
    else
      false
    end
  end

  def canDeletePost(user, post)
    if post.neighborhood.users.include?(user)
      user.id == post.user_id || is_lead(user, user.current_neighborhood)
    else
      false
    end
  end

  def is_lead(user, neighborhood)
    # logic for determining if user is a lead goes here
    false
  end
end
