require 'test/unit'
require 'rubygems' 
require 'action_controller'
require 'action_controller/test_process' 
require 'session_management'
require 'session_management/session.rb'

ActionController::Base.send( :include, SessionManagement )
ActionController::Routing::Routes.reload rescue nil
ActionController::Routing::Routes.draw do |map|
  map.connect ':controller/:action/:id'
end

class UserSession < SessionManagement::Session
  member     :last_action
  collection :products
end

class SessionManagementController < ActionController::Base
  enable_session_management

  def set_last_action
    user_session.last_action = "index"
    render :xml => "<message>index</message>"
  end

  def get_last_action
    render :xml => "<last_action>#{user_session.last_action}</last_action>"
  end
  
  def add_product
    user_session.add_product(params[:id].to_s)
    render :xml => "<message>index</message>"
  end

  def get_products
    render :xml => "<products>#{user_session.products.collect{|a| a + ", "}.to_s.chop.chop}</products>"
  end

end

class SessionManagementTest < Test::Unit::TestCase

  def setup
    @controller = SessionManagementController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end


  def test_should_manage_members_in_session
    get :set_last_action
    assert_response :success
    assert_select 'message', 'index'
    
    get :get_last_action
    assert_response :success
    assert_select 'last_action', 'index'
  end
  
  def test_should_manage_collection_in_session
    get :add_product, :id => 1
    assert_response :success
    assert_select 'message', 'index'
    
    get :add_product, :id => 2
    assert_response :success
    assert_select 'message', 'index'
    
    get :get_products
    assert_response :success
    assert_select 'products', '1, 2'
  end
end