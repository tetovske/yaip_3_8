require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  
  test 'check main page' do
    get root_path
    assert_response :success
  end

  test 'check result page' do
    get find_path, params: { n: 3, handling: 'Не обрабатывать' }
    assert_response :success
  end
end
