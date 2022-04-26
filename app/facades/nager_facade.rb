class NagerFacade

  def holidays
    service.get_holidays.map do |data|
      Holiday.new(data)
    end
  end

  def service
    NagerService.new
  end
end
