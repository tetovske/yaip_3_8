# frozen_string_literal: true

# Number controller class
class NumberController < ApplicationController
  def index; end

  def armstrong
    @result = find_armstrong(params[:n].to_i)
  end

  private

  def find_armstrong(dig)
    return unless dig.positive?

    ((10**(dig - 1))..(10**dig - 1)).select { |v| v.to_s.split('').map { |d| d.to_i**dig }.reduce(:+).eql?(v) }
  end
end
