require 'test/unit'
require 'rubygems' 
require 'action_controller'
require 'action_controller/test_process' 
require 'session_management'
require 'session_management/session.rb'
  
class UserSessionTest < Test::Unit::TestCase

  class UserSession < SessionManagement::Session
    member  :last_action
    collection :products
  end
  
  def setup
    @user_session = UserSession.new(Hash.new) 
  end

  def test_should_set_and_get_member
    @user_session.last_action = "index"
    assert_equal "index", @user_session.last_action
  end
  
  def test_should_reset_member
    @user_session.last_action = "index"
    value = @user_session.reset_last_action
    assert_equal "index", value
    assert_nil @user_session.last_action
  end
  
  def test_should_add_to_and_get_collection
    @user_session.add_product(1)
    assert_equal 1, @user_session.products[0]
    @user_session.add_product(2)
    assert_equal [1,2], @user_session.products
  end
  
  def test_should_reset_collection
    @user_session.add_product(1)
    @user_session.reset_products
    assert_equal [], @user_session.products
  end
  
end