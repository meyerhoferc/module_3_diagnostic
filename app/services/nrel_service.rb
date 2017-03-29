class NRELService
  def initialize
    @nrel_key = ENV['NREL_KEY']
  end

  def get_stations_by_zipcode(zipcode)
    stations = HTTParty.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{@nrel_key}&location=#{zipcode}&radius=6.0&status=E&fuel_type=ELEC,LPG&limit=10")
    parse(stations)[:fuel_stations]
    # byebug
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
