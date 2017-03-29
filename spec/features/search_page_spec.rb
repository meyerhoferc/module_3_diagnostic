require 'rails_helper'

describe "when a user goes to /search" do
  it "they see a list of 10 closest stations and their attributes" do
    stations = Fabricate.times(10, :station)
    allow_any_instance_of(Station).to receive(:search_by_zipcode).and_return(stations)
    visit search_path

    within(".station_one") do
      expect(page).to have_content("Station: #{stations.first.name}")
      expect(page).to have_content("Address: #{stations.first.address}")
      expect(page).to have_content("Distance: #{stations.first.distance}")
      expect(page).to have_content("Times of Operation: #{stations.first.access_times}")
      expect(page).to have_content("Fuel Types: #{stations.first.fuel_types}")
    end
  end
end
