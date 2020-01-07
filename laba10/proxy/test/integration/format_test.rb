require 'test_helper'

# Comparison test class
class FormatTest < ActionDispatch::IntegrationTest

  test 'check client processing request' do
      get find_path, :params => { :n => '3', :handling => 'Клиент' }
      content = '<?xml-stylesheet type="text/xsl" href="/converter.xslt"?>'
      assert response.body.include?(content)
  end

  test 'check response with server processing' do
      get find_path, :params => { :n => '3', :handling => 'Сервер' }
      content = ['<html>', '<body>', '<table', '<th', '<tr']
      res = response.body
      assert content.all? { |str| res.include?(str) }
  end

  test 'check response without any handlings' do
      get find_path, :params => { :n => '3', :handling => 'Не обрабатывать' }
      content = ['<?xml version="1.0" encoding="UTF-8"?>', '<integer']
      not_incl = '<?xml-stylesheet type="text/xsl" href="/converter.xslt"?>'
      res = response.body
      assert content.all? { |str| res.include?(str) } && res.exclude?(not_incl)
  end
end