# == Schema Information
#
# Table name: neinfos
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NeinfosControllerTest < ActionController::TestCase
  setup do
    @neinfo = neinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:neinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create neinfo" do
    assert_difference('Neinfo.count') do
      post :create, neinfo: {  }
    end

    assert_redirected_to neinfo_path(assigns(:neinfo))
  end

  test "should show neinfo" do
    get :show, id: @neinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @neinfo
    assert_response :success
  end

  test "should update neinfo" do
    patch :update, id: @neinfo, neinfo: {  }
    assert_redirected_to neinfo_path(assigns(:neinfo))
  end

  test "should destroy neinfo" do
    assert_difference('Neinfo.count', -1) do
      delete :destroy, id: @neinfo
    end

    assert_redirected_to neinfos_path
  end
end
