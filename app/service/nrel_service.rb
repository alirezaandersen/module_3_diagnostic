class NrelService

  def initialize
    @connection = Faraday.new("https://developer.nrel.gov")
    @connection.params["api_key"] = ENV["NREL_API_KEY"]
  end

  def nearest_energy_fuel_station(params)
    json_request(@connection.get("api/alt-fuel-stations/v1/nearest.json?",params))
  end

  private

  def json_request(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
