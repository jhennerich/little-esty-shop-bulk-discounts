class NagerFacade
  def holidays
    service.get_holdiday.map do |data|
      Holidays.new(data)
    end
  end

  def service
    NagerService.new
  end
end
