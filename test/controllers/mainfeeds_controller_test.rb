# == Schema Information
#
# Table name: mainfeeds
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MainfeedsControllerTest < ActionController::TestCase
  setup do
    @mainfeed = mainfeeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainfeeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainfeed" do
    assert_difference('Mainfeed.count') do
      post :create, mainfeed: {  }
    end

    assert_redirected_to mainfeed_path(assigns(:mainfeed))
  end

  test "should show mainfeed" do
    get :show, id: @mainfeed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mainfeed
    assert_response :success
  end

  test "should update mainfeed" do
    patch :update, id: @mainfeed, mainfeed: {  }
    assert_redirected_to mainfeed_path(assigns(:mainfeed))
  end

  test "should destroy mainfeed" do
    assert_difference('Mainfeed.count', -1) do
      delete :destroy, id: @mainfeed
    end

    assert_redirected_to mainfeeds_path
  end
end
