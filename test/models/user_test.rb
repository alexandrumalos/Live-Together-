# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  username                :string
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default("0"), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string
#  last_sign_in_ip         :string
#  forem_admin             :boolean          default("f")
#  forem_state             :string           default("pending_review")
#  forem_auto_subscribe    :boolean          default("f")
#  current_neighborhood_id :integer
#  type                    :string
#  score                   :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
