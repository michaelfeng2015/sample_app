require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "吃货网 | 一家专业吃东西的网站"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "吃货求助 | 一家专业吃东西的网站"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "关于吃货 | 一家专业吃东西的网站"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "联系吃货 | 一家专业吃东西的网站"    
  end

end
