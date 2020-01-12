require 'test_helper'

class CalculationTest < ActiveSupport::TestCase
  test 'add new record to db' do
    req = '1'
    unless exs = Calculation.find_by(request: req).nil?
      Calculation.find_by(request: req).destroy
    end
    Calculation.create(request: req, response: '{}').save
    assert_not_nil Calculation.find_by(request: req).nil?
    Calculation.find_by(request: req).destroy if exs
  end

  test 'duplicate addition' do
    req = '1'
    unless exs = Calculation.find_by(request: req).nil?
      Calculation.find_by(request: req).destroy
    end
    Calculation.create(request: req, response: '{}').save
    assert_not Calculation.create(request: req, response: '{}').valid?
    Calculation.find_by(request: req).destroy if exs
  end
end
