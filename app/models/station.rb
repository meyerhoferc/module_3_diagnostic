class Station
  attr_reader :name,
              :address,
              :distance,
              :fuel_types,
              :access_times
              
  def initialize(station_data)
    @name = station_data[:name]
    @address = station_data[:address]
    @distance = station_data[:distance]
    @fuel_types = station_data[:fuel_types]
    @access_times = station_data[:access_times]
  end

  def self.nrel_service
    @nrel_service ||= NRELService.new
  end

  def self.search_by_zipcode(zipcode)
    nrel_service.get_stations_by_zipcode(zipcode).map do |station|
      Station.new(name: station[:station_name],
                  address: station[:street_address],
                  fuel_types: station[:fuel_type_code],
                  distance: station[:distance],
                  access_times: station[:access_days_time])
    end
  end
end
