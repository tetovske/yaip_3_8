# frozen_string_literal: true

require 'test_helper'

class NumberControllerTest < ActionDispatch::IntegrationTest
  test 'check main page' do
    get root_path
    assert_response :success
  end

  test 'check result page' do
    get find_path, params: { n: '3', handling: 'Не обрабатывать' }
    assert_response :success
  end

  test 'check rss request' do
    get find_path, params: { n: '3', handling: 'Не обрабатывать', format: :rss }
    assert response.body.include?('<?xml version="1.0" encoding="UTF-8"?>')
  end

  test 'compare different requests' do
    get find_path, params: { n: '3', handling: 'Не обрабатывать', format: :rss }
    res1 = response.body
    get find_path, params: { n: '4', handling: 'Не обрабатывать', format: :rss }
    res2 = response.body
    assert_not_equal res1, res2
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
