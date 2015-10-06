require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "搞基网 | 一家专业搞基的网站"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "搞基求助 | 一家专业搞基的网站"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "关于搞基 | 一家专业搞基的网站"
  end
end
