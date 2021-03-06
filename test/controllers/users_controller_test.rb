require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
  	@user = users(:Michael)
    @other_user = users(:Zoe)

  end

  test "should get new" do
    get :new
    assert_response :success
    assert_select "title", "加入吃货 | 一家专业吃东西的网站"
  end

  test "should redirect edit when not logged in" do
  	get :edit, id: @user
  	assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
  	patch :update, id: @user, user: { name: @user.name, email: @user.email }
  	assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_redirected_to root_url
  end

  test "should redirect index when not logged in" do
    get :index
    assert_redirected_to login_url
  end
end