# frozen_string_literal: true

require 'selenium-webdriver'
require 'test_helper'

class SeleniumTest < ActionDispatch::IntegrationTest
  setup do
    @driver = Selenium::WebDriver.for :firefox
    @driver.navigate.to 'http://localhost:3000'
  end

  teardown do
    @driver.quit
  end

  test 'check response with n = 0' do
    @driver.find_element(:id, 'input').send_keys '0'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    sel1 = '/html/body/div/p[2]'
    assert @driver.find_elements(:xpath, sel1).first.text == 'Чисел Армстронга не найдено.'
  end

  test 'check response with n = 3' do
    @driver.find_element(:id, 'input').send_keys '3'
    @driver.find_element(:id, 'submit-but').click
    sleep 2
    sel1 = '/html/body/div/table/tbody/tr/td'
    expected = [153, 370, 371, 407]
    actual = @driver.find_elements(:xpath, sel1).map(&:text)
    assert expected, actual
  end
end
