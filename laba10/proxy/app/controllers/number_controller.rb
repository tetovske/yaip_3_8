# frozen_string_literal: true

require 'net/http'
require 'nokogiri'
require 'open-uri'

# Number controller class
class NumberController < ApplicationController
  def index; end

  def armstrong
    response = Nokogiri::XML(URI.open("#{MAIN_SERV}/number/find.xml?n=#{params[:n].to_i}"))

    case params['handling']
    when 'Клиент'
      render xml: add_str(response, XSLT_NAME)
    when 'Сервер'
      render inline: append_xslt(response, "#{Rails.root}/public/#{XSLT_NAME}")
    when 'Не обрабатывать'
      render xml: response
    end
  end

  private

  MAIN_SERV = 'http://localhost:3000'
  XSLT_NAME = 'converter.xslt'

  def add_str(document, xslt_path)
    str = Nokogiri::XML::ProcessingInstruction
          .new(document, 'xml-stylesheet', "type=\"text/xsl\" href=\"/#{xslt_path}\"")
    document.root.add_previous_sibling str
    document
  end

  def append_xslt(document, xslt_path)
    xslt = Nokogiri::XSLT(File.read(xslt_path))
    xslt.transform(document)
  end
end
