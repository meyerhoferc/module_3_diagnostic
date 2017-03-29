require 'rails_helper'

describe Station do
  describe "#search_by_zipcode" do
    it "returns stations within 6 miles of zipcode" do
      station_data_one = {
        "access_days_time": "MON: 24 hours | TUE: 24 hours | WED: 24 hours | THU: 24 hours | FRI: 24 hours | SAT: 24 hours | SUN: 24 hours",
        "fuel_type_code": "ELEC",
        "station_name": "Pennington St. Garage",
        "street_address": "110 E. Pennington",
        "distance": 0.58563
      }
      station_data_two = {
        "access_days_time": "MON: 6:00am-9:00pm | TUE: 6:00am-9:00pm | WED: 6:00am-9:00pm | THU: 6:00am-9:00pm | FRI: 6:00am-9:00pm",
        "fuel_type_code": "ELEC",
        "station_name": "Joel D Valdez Library",
        "street_address": "50 W. Alameda Street",
        "distance": 0.65758
      }
      stations = [JSON.parse(station_data_one.to_json), JSON.parse(station_data_two.to_json)]
      allow_any_instance_of(NRELService).to receive(:get_stations_by_zipcode).and_return(stations)
      stations = Station.search_by_zipcode(85701)
      expect()
    end
  end
end