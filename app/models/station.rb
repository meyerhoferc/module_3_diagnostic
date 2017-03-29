class Station
  attr_reader :name,
              :address,
              :distance,
              :fuel_types,
              :access_times
  def initialize(station_data)
    @name = station_data[:station_name]
    @address = station_data[:street_address]
    @distance = station_data[:distance]
    @fuel_types = station_data[:fuel_type_code]
    @access_times = station_data[:access_days_time]
  end
end
