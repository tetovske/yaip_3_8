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
    assert_equal '[153,370,371,407]', response.body
  end

  test 'check with n = 4' do
    get find_path, params: { n: '4' }
    assert_equal '[1634,8208,9474]', response.body
  end

  test 'compare responses with different requests' do
    get find_path, params: { n: '4' }
    res1 = response.body
    get find_path, params: { n: '5' }
    res2 = response.body
    assert_not_equal res1, res2 
  end
end
