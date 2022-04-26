class NagerFacade
  def holidays
    service.holidays.map do |data|
      Holidays.new(data)
    end
  end

  def service
    NagerService.new
  end
end
