require 'rails_helper'

describe "when a user goes to /search" do
  it "they see a list of 10 closest stations and their attributes" do
    stations = []
    10.times do |i|
      station_data = {name: "Pennington Garage#{i}",
                      address: "110 E. Pennington",
                      distance: 0.58563,
                      access_times: "24/7",
                      fuel_types: "ELEC, LPG"}
      stations << Station.new(station_data)
    end
    allow(Station).to receive(:search_by_zipcode).and_return(stations)
    visit root_path

    within(".search-field") do
      fill_in("q", with: "85701")
    end

    click_on "Locate"

    expect(current_path).to eq(search_path)

    within(".Garage0") do
      expect(page).to have_content("Station: #{stations.first.name}")
      expect(page).to have_content("Address: #{stations.first.address}")
      expect(page).to have_content("Distance: #{stations.first.distance} miles")
      expect(page).to have_content("Times of Operation: #{stations.first.access_times}")
      expect(page).to have_content("Fuel Types Available: #{stations.first.fuel_types}")
    end
  end
end
