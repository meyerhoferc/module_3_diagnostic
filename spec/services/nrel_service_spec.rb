require 'rails_helper'

describe "NRELSerivce" do
  describe "get_stations_by_zipcode(zipcode)" do
    it "returns stations within 6.0 miles of the zipcode" do
      service = NRELService.new
      stations = service.get_stations_by_zipcode(85701)
      expect(stations.first[:access_days_time]).to eq("MON: 24 hours | TUE: 24 hours | WED: 24 hours | THU: 24 hours | FRI: 24 hours | SAT: 24 hours | SUN: 24 hours")
      expect(stations.first[:fuel_type_code]).to eq("ELEC")
      expect(stations.first[:station_name]).to eq("Pennington St. Garage")
      expect(stations.first[:distance]).to eq("0.58563")
      expect(stations.first[:street_address]).to eq("110 E. Pennington")
      expect(stations.count).to eq(10)
    end
  end
end
