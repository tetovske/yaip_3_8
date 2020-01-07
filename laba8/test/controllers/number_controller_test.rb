require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  
  test 'check main page' do
    get root_path
    assert_response :success
  end

  test 'check result page' do
    get find_path
    assert_response :success
  end

  test 'check with n = 3' do
    get find_path, params: { n: '3' }
    assert_equal [153, 370, 371, 407], assigns[:result]
  end

  test 'check with n = 4' do
    get find_path, params: { n: '4' }
    assert_equal [1634, 8208, 9474], assigns[:result]
  end
end
