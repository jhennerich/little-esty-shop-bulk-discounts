class NagerService
  def get_url(url)
    response = HTTParty.get(https://date.nager.at/api/v3/publicholidays/2022/US`)
    parsed = JSON.parse(response.body, symoblize_names: true)
  end
end
