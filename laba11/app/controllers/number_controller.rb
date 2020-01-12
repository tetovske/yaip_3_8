# frozen_string_literal: true

# Number controller class
class NumberController < ApplicationController
  def index; end

  def armstrong
    render json: get_armstrong(params[:n].to_i)
  end

  def all_records
    render xml: Calculation.parse_db
  end

  def last_record
    render xml: Calculation.parse_db.last
  end

  private

  def get_armstrong(digits)
    return Calculation.find_response(digits) unless Calculation.find_response(digits).nil?

    result = find_armstrong(digits)
    Calculation.add_response(digits, result)
    result
  end

  def find_armstrong(dig)
    return unless dig.positive?

    ((10**(dig - 1))..(10**dig - 1)).select { |v| v.to_s.split('').map { |d| d.to_i**dig }.reduce(:+).eql?(v) }
  end
end
