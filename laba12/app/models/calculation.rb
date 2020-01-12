class Calculation < ApplicationRecord
  validates :request, uniqueness: true

  class << self
    def find_response(data)
      return if Calculation.find_by(request: data).nil?
  
      JSON.parse(Calculation.find_by(request: data).response)
    end
  
    def add_response(req, res)
      parsed = res.to_json
      record = Calculation.create(request: req, response: parsed)
      record.save if record.valid?
    end
  
    def parse_db
      Calculation.all.map { |rec| [rec.request, rec.response] }
    end
  end
end
