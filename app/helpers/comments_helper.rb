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

module CommentsHelper
  def comments_button(post)
    if post.comments.count > 0
      post.comments.count.to_s + ' comments'
    else
      'Leave a comment'
    end
  end

  def can_delete_comment(user, comment)
    if comment.user_id == user.id || is_lead(user, user.current_neighborhood)
      true
    else
      false
    end
  end
end
