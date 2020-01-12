require 'test_helper'

# SessionController class
class RegistartionTest < ActionDispatch::IntegrationTest
  test 'cant go anywhere without login' do
    get signout_path
    get find_path
    assert_response :redirect
    assert_redirected_to signin_path
  end

  test 'create fake user and make some stuff' do
    unless usr = User.find_by(email: 'test@email.com').nil?
      User.find_by(email: 'test@email.com').destroy
    end
    User.create(email: 'test@email.com', password: Digest::SHA256.hexdigest('1234')).save 
    get auth_url, params: { email: 'test@email.com', pass: '1234' }
    get find_url, params: { n: '4' }
    assert_response :success
    User.find_by(email: 'test@email.com').destroy if usr
  end
end