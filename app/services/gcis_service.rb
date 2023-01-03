class GcisService
  include Callable

  def initialize(gui_number)
    @uri = "https://data.gcis.nat.gov.tw/od/data/api/5F64D864-61CB-4D0D-8AD9-492047CC1EA6?$format=json&$filter=Business_Accounting_NO eq #{gui_number}"
  end

  def call
    res = Faraday.get(@uri)
    raise ActiveRecord::RecordNotFound if res.body.empty?

    JSON.parse(res.body)[0]
  end
end
